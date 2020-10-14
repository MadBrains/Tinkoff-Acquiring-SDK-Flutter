import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../core/constants.dart';
import '../core/tinkoff_acquiring.dart';
import '../core/models/submit_3ds_authorization/submit_3ds_authorization_response.dart';

/// WebView для прохождения 3-D Secure
class WebView3DS extends StatefulWidget {
  /// Конструктор WebView для прохождения 3-D Secure
  const WebView3DS({
    Key key,
    @required this.acquiring,
    @required this.acsUrl,
    @required this.md,
    @required this.paReq,
    @required this.onFinished,
    @required this.onLoad,
  }) : super(key: key);

  /// Конфигуратор SDK
  final TinkoffAcquiring acquiring;

  /// URL обработчик на стороне мерчанта, принимающий результаты прохождения 3-D Secure
  final String acsUrl;

  /// Уникальный идентификатор транзакции в системе Банка (возвращается в ответе на FinishAuthorize)
  final String md;

  /// Результат аутентификации 3-D Secure (возвращается в ответе на FinishAuthorize)
  final String paReq;

  /// Результат 3-D Secure
  final Function(Submit3DSAuthorizationResponse) onFinished;

  /// Загрузка
  final Function(bool) onLoad;

  @override
  _WebView3DSState createState() => _WebView3DSState();
}

class _WebView3DSState extends State<WebView3DS> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  String get termUrl => Uri.encodeFull((widget.acquiring.debug
          ? NetworkSettings.apiUrlDebug
          : NetworkSettings.apiUrlRelease) +
      ApiMethods.submit3DSAuthorization);

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: '',
      gestureNavigationEnabled: true,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
        _loadHTML();
      },
      onPageStarted: (String url) {
        if (url == termUrl) {
          widget.onLoad(true);
        }
      },
      onPageFinished: (String url) async {
        if (url == termUrl) {
          final String rawResponse =
              await _controller.future.then((WebViewController v) async {
            final String document = await v
                .evaluateJavascript('document.documentElement.innerHTML');
            final String response =
                RegExp('{.+}').firstMatch(document).group(0);
            return response.replaceAll(RegExp('\\"').pattern, '"');
          });

          widget.acquiring.logger.log(rawResponse, name: 'RawResponse');

          final Submit3DSAuthorizationResponse response =
              Submit3DSAuthorizationResponse.fromJson(
                  jsonDecode(rawResponse) as Map<String, dynamic>);

          widget.acquiring.logger.log(response.toString(), name: 'Response');
          widget.onFinished(response);
        } else {
          widget.onLoad(false);
        }
      },
    );
  }

  void _loadHTML() {
    final String fileText = '''
      <html>
        <body onload="document.f.submit();">
          <form name="payForm" action="${widget.acsUrl}" method="POST">
            <input type="hidden" name="PaReq" value="${widget.paReq}">
            <input type="hidden" name="MD" value="${widget.md}">
            <input type="hidden" name="TermUrl" value="$termUrl">
          </form>
          <script>
            window.onload = submitForm;
            function submitForm() { payForm.submit(); }
          </script>
        </body>
      </html>
    ''';

    _controller.future.then((WebViewController v) {
      v.loadUrl(Uri.dataFromString(
        fileText,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8'),
      ).toString());
    });
  }
}
