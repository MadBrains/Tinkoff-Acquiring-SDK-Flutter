import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants.dart';
import '../models/base/acquiring_request.dart';
import '../models/base/acquiring_response.dart';
import '../utils/logger.dart';

/// Класс для работы с сетью
class NetworkClient {
  /// Метод вызывает созданный запрос на Acquiring API
  Future<Response> call<Response extends AcquiringResponse>(
    AcquiringRequest request,
    Map<String, dynamic> body,
    Response Function(Map<String, dynamic> json) response, {
    String proxyUrl,
    bool debug = true,
    BaseLogger logger,
  }) {
    final Completer<Response> _completer = Completer<Response>();
    final String rawRequest = jsonEncode(body);
    logger.log(rawRequest, name: 'RawRequest');

    http
        .post(
          Uri.encodeFull((proxyUrl ??
                  (debug
                      ? NetworkSettings.apiUrlDebug
                      : NetworkSettings.apiUrlRelease)) +
              request.apiMethod),
          headers: NetworkSettings.headers,
          body: rawRequest,
          encoding: Encoding.getByName('UTF-8'),
        )
        .then((http.Response rawResponse) {
          if (rawResponse.statusCode == 200) {
            logger.log(rawResponse.body, name: 'RawResponse');
            Response _response;
            final dynamic json = jsonDecode(rawResponse.body);

            if (json is List) {
              if (request.apiMethod == ApiMethods.getCardList) {
                _response =
                    response(<String, dynamic>{JsonKeys.cardInfo: json});
              } else {
                Exception('ApiMethod for list error');
              }
            } else if (json is Map) {
              _response = response(json as Map<String, dynamic>);
            } else {
              Exception('REST type error');
            }

            logger.log(_response.toString(), name: 'Response');
            _completer.complete(_response);
          } else {
            _completer.completeError(rawResponse);
          }
        })
        .timeout(NetworkSettings.timeout)
        .catchError((dynamic error) {
          logger.log('', name: 'HTTP Error', error: error);
          _completer.completeError(error);
        });

    return _completer.future;
  }
}
