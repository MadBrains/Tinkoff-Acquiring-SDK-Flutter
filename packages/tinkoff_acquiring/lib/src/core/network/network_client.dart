import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../constants.dart';
import '../../utils/crypto_utils.dart';
import '../models/base/acquiring_request.dart';
import '../models/base/acquiring_response.dart';
import '../tinkoff_acquiring_config.dart';

/// {@template network_client}
/// Класс для работы с сетью
/// {@endtemplate}
class NetworkClient {
  /// {@macro network_client}
  NetworkClient(this._config);

  /// {@macro tinkoff_acquiring_config}
  final TinkoffAcquiringConfig _config;

  /// Метод вызывает созданный запрос на Acquiring API
  Future<Response> call<Response extends AcquiringResponse>(
    AcquiringRequest request,
    Response Function(Map<String, dynamic> json) response,
  ) {
    final Completer<Response> _completer = Completer<Response>();
    final String rawRequest = jsonEncode(_modifyRequest(request));
    _config.logger.log(message: rawRequest, name: 'RawRequest');

    http
        .post(
          Uri.parse((_config.proxyUrl ?? _config.apiUrl) + request.apiMethod),
          headers: NetworkSettings.headers,
          body: rawRequest,
          encoding: Encoding.getByName('UTF-8'),
        )
        .then((http.Response rawResponse) {
          if (rawResponse.statusCode == 200) {
            _config.logger.log(message: rawResponse.body, name: 'RawResponse');
            late Response _response;
            final dynamic json = jsonDecode(rawResponse.body);

            if (json is List) {
              if (request.apiMethod == ApiMethods.getCardList) {
                _response =
                    response(<String, dynamic>{JsonKeys.cardInfo: json});
              } else {
                throw Exception('ApiMethod for list error');
              }
            } else if (json is Map) {
              _response = response(json as Map<String, dynamic>);
            } else {
              throw Exception('REST type error');
            }

            _config.logger.log(message: _response.toString(), name: 'Response');
            _completer.complete(_response);
          } else {
            throw http.ClientException(
                rawResponse.reasonPhrase ?? '', rawResponse.request?.url);
          }
        })
        .timeout(NetworkSettings.timeout)
        .catchError((Object error) {
          _config.logger
              .log(message: '', name: 'HTTP Error', error: error.toString());
          _completer.completeError(error);
        });

    return _completer.future;
  }

  Map<String, dynamic> _modifyRequest(AcquiringRequest request) {
    final Map<String, dynamic> temp = request.toJson();
    if (_config.proxyUrl != null) return temp;
    if (request.signToken != null) {
      return temp
        ..addAll(<String, dynamic>{
          JsonKeys.terminalKey: _config.terminalKey,
        });
    }

    final String token =
        SignToken.generate(_config.terminalKey!, _config.password!, request);
    final Map<String, dynamic> _request = temp
      ..addAll(<String, dynamic>{
        JsonKeys.terminalKey: _config.terminalKey,
        JsonKeys.token: token,
      });

    _config.logger.log(message: '$_request', name: 'Token');
    return _request;
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
  static String generate(
    String terminalKey,
    String password,
    AcquiringRequest request,
  ) {
    final Map<String, dynamic> temp = request.toJson()
      ..addAll(<String, dynamic>{
        JsonKeys.terminalKey: terminalKey,
        JsonKeys.password: password,
      });
    final List<String> sortedKeys = List<String>.from(temp.keys)..sort();
    final StringBuffer buffer = StringBuffer();

    for (int i = 0; i < sortedKeys.length; i++) {
      if (!Ignore.ignoredFields.contains(sortedKeys[i])) {
        buffer.write(temp[sortedKeys[i]]);
      }
    }

    return CryptoUtils.sha256(buffer.toString());
  }
}
