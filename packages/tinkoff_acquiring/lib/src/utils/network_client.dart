import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../core/models/base/base.dart';
import '../core/tinkoff_acquiring_config.dart';
import 'crypto_utils.dart';

/// {@template network_client}
/// Класс для работы с сетью
/// {@endtemplate}
class NetworkClient {
  /// {@macro network_client}
  const NetworkClient(this._config);

  /// {@macro tinkoff_acquiring_config}
  final TinkoffAcquiringConfig _config;

  /// Метод вызывает созданный запрос на Acquiring API
  Future<Response> call<Response extends AcquiringResponse>(
    AcquiringRequest request,
    Response Function(Map<String, dynamic> json) response,
  ) async {
    final TinkoffAcquiringConfig config = _config;

    Map<String, String>? proxyHeaders;
    Uri? url;

    if (config is TinkoffAcquiringConfigProxy) {
      final ProxyRequest? setting = config.mapping?.call(
        request,
        isDebugMode: _config.isDebugMode,
      );

      proxyHeaders = <String, String>{
        ...?config.globalHeaders,
        ...?setting?.headers
      };

      url = config.url(
        config.proxyPath + (setting?.methodPath ?? request.apiMethodPath),
      );
    }

    final Map<String, String> headers = <String, String>{
      ...request.headers,
      ...?proxyHeaders,
    };

    url ??= config.url(NetworkSettings.apiPath + request.apiMethodPath);

    final String rawRequest = jsonEncode(_modifyRequest(request, config));

    config.logger.log(message: url.toString(), name: 'Request URL');
    config.logger.log(message: headers.toString(), name: 'Request headers');
    config.logger.log(message: rawRequest.toString(), name: 'RawRequest');

    http.Response rawResponse;
    try {
      rawResponse = await http
          .post(
            url,
            headers: headers,
            body: rawRequest,
            encoding: Encoding.getByName('UTF-8'),
          )
          .timeout(NetworkSettings.timeout);
    } catch (error, stackTrace) {
      config.logger.log(
        message: '',
        name: 'HTTP Error',
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }

    config.logger.log(
      message: '${rawResponse.statusCode} | ${rawResponse.body}',
      name: 'RawResponse',
    );

    if (rawResponse.statusCode != 200) {
      throw http.ClientException(
        rawResponse.reasonPhrase ?? '',
        rawResponse.request?.url,
      );
    }

    late Response _response;
    final dynamic json = jsonDecode(rawResponse.body);

    if (json is List) {
      if (request.apiMethod == ApiMethods.getCardList) {
        _response = response(<String, dynamic>{JsonKeys.cardInfo: json});
      } else {
        throw Exception('ApiMethod for list error');
      }
    } else if (json is Map) {
      _response = response(json as Map<String, dynamic>);
    } else {
      throw Exception('REST type error');
    }

    config.logger.log(message: _response.toString(), name: 'Response');
    return _response;
  }

  Map<String, dynamic> _modifyRequest(
    AcquiringRequest request,
    TinkoffAcquiringConfig config,
  ) {
    final Map<String, dynamic> temp = request.toJson();

    switch (config) {
      case TinkoffAcquiringConfigCredential():
        final String token = SignToken.generate(
          terminalKey: config.terminalKey,
          password: config.password,
          request: request,
        );

        final Map<String, dynamic> _request = temp
          ..addAll(
            <String, dynamic>{
              JsonKeys.terminalKey: config.terminalKey,
              JsonKeys.token: token,
            },
          );

        return _request;
      case TinkoffAcquiringConfigToken():
        return temp
          ..addAll(
            <String, dynamic>{
              JsonKeys.terminalKey: config.terminalKey,
            },
          );
      case TinkoffAcquiringConfigProxy():
        return temp;
    }
  }
}

/// {@template sign_token}
/// Создает токен, на основе [terminalKey], [password], [request]
///
/// Можно использовать только для тестирования
/// {@endtemplate}
class SignToken {
  /// {@macro sign_token}
  @visibleForTesting
  static String generate({
    required String terminalKey,
    required AcquiringRequest request,
    String? password,
  }) {
    final Map<String, dynamic> temp = request.toJson()
      ..addAll(<String, dynamic>{
        JsonKeys.terminalKey: terminalKey,
        if (password != null && password.isNotEmpty)
          JsonKeys.password: password,
      });
    final List<String> sortedKeys = List<String>.from(temp.keys)..sort();
    final StringBuffer buffer = StringBuffer();

    for (int i = 0; i < sortedKeys.length; i++) {
      if (!request.ignoredFields.contains(sortedKeys[i])) {
        buffer.write(temp[sortedKeys[i]]);
      }
    }

    return CryptoUtils.sha256(buffer.toString());
  }
}
