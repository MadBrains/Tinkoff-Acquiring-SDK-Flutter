import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:tinkoff_acquiring/tinkoff_acquiring.dart';
import 'package:tinkoff_acquiring_flutter/src/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'constants.dart';

/// WebView для прохождения 3-D Secure
class WebView3DS extends StatefulWidget {
  /// Конструктор WebView для прохождения 3-D Secure
  const WebView3DS({
    Key? key,
    required this.onFinished,
    required this.onLoad,
    required this.config,
    required this.is3DsVersion2,
    required this.acsUrl,
    this.md,
    this.paReq,
    this.acsTransId,
    this.version,
    this.serverTransId,
  }) : super(key: key);

  /// Конфигуратор SDK
  final TinkoffAcquiringConfig config;

  /// URL обработчик на стороне мерчанта, принимающий результаты прохождения 3-D Secure
  final String acsUrl;

  /// Уникальный идентификатор транзакции, присвоенный ACS
  final String? acsTransId;

  /// Уникальный идентификатор транзакции в системе Банка (возвращается в ответе на FinishAuthorize)
  final String? md;

  /// Результат аутентификации 3-D Secure (возвращается в ответе на FinishAuthorize)
  final String? paReq;

  /// Проверка 3DS версии протокола
  final bool is3DsVersion2;

  /// Версия протокола 3DS
  final String? version;

  /// Уникальный идентификатор транзакции, генерируемый 3DS-Server,
  /// обязательный параметр для 3DS второй версии
  final String? serverTransId;

  /// Результат 3-D Secure
  final void Function(Submit3DSAuthorizationResponse?) onFinished;

  /// Загрузка 3-D Secure
  final void Function(bool) onLoad;

  String get _termUrl => config
      .apiUrl(
        is3DsVersion2
            ? WebViewMethods.submit3DSAuthorizationV2
            : WebViewMethods.submit3DSAuthorization,
      )
      .toString();

  String get _createCreq {
    final String? serverTransId = this.serverTransId;
    final String? acsTransId = this.acsTransId;
    final String? version = this.version;

    final Map<String, String> params = <String, String>{
      if (serverTransId != null)
        WebViewKeys.threeDSServerTransId: serverTransId,
      if (acsTransId != null) WebViewKeys.acsTransId: acsTransId,
      if (version != null) WebViewKeys.messageVersion: version,
      WebViewKeys.challengeWindowSize: WebViewSettings.challengeWindowSize,
      WebViewKeys.messageType: WebViewSettings.messageType,
    };

    config.logger.log(
      message: params.toString(),
      name: 'WebView3DS',
    );

    final String base = base64WithoutPadding(
      Uint8List.fromList(jsonEncode(params).codeUnits),
    ).trim();

    return Uri.encodeFull(base);
  }

  String get _v1 => '''
      <html>
        <body onload="document.form.submit();">
          <form name="payForm" action="$acsUrl" method="POST">
            <input type="hidden" name="TermUrl" value="$_termUrl">
            <input type="hidden" name="MD" value="$md">
            <input type="hidden" name="PaReq" value="$paReq">
          </form>
          <script>
            window.onload = submitForm;
            function submitForm() { payForm.submit(); }
          </script>
        </body>
      </html>
    ''';

  String get _v2 => '''
      <html>
        <body onload="document.form.submit();">
          <form name="payForm" action="$acsUrl" method="POST">
            <input type="hidden" name="creq" value="$_createCreq">
          </form>
          <script>
            window.onload = submitForm;
            function submitForm() { payForm.submit(); }
          </script>
        </body>
      </html>
    ''';

  @override
  _WebView3DSState createState() => _WebView3DSState();
}

class _WebView3DSState extends State<WebView3DS> {
  late final WebViewController _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (String url) async {
          await _logNavigationDelegate('onPageStarted', url);

          if (url == widget._termUrl) {
            widget.onLoad(true);
          }
        },
        onPageFinished: (String url) async {
          await _logNavigationDelegate('onPageFinished', url);

          // Отмена проверки 3-D Secure
          for (final String action in WebViewSettings.cancelActions) {
            if (url.contains(action)) {
              widget.onFinished(null);
              return;
            }
          }

          if (url == widget._termUrl) {
            await _response();
          } else {
            widget.onLoad(false);
          }
        },
      ),
    )
    ..loadHtmlString(widget.is3DsVersion2 ? widget._v2 : widget._v1);

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: _controller,
    );
  }

  Future<void> _logNavigationDelegate(String name, String url) async {
    final String _document = await _controller.runJavaScriptReturningResult(
      'document.documentElement.outerHTML',
    ) as String;

    widget.config.logger.log(
      message: '$name: $url\n$_document\n',
      name: 'WebView3DS',
    );
  }

  Future<void> _response() async {
    try {
      final String _document = await _controller.runJavaScriptReturningResult(
        'document.documentElement.innerHTML',
      ) as String;

      final String? _response = RegExp('{.+}').firstMatch(_document)?.group(0);

      final String rawResponse =
          _response?.replaceAll(RegExp('\\"').pattern, '"') ?? _document;

      widget.config.logger.log(message: rawResponse, name: 'WebView3DS');

      final Submit3DSAuthorizationResponse response =
          Submit3DSAuthorizationResponse.fromJson(
        jsonDecode(rawResponse) as Map<String, dynamic>,
      );

      widget.config.logger.log(message: response.toString(), name: 'Response');
      widget.onFinished(response);
    } catch (e, st) {
      widget.config.logger.log(
        message: 'Failed parse 3ds response',
        name: 'WebView3DS',
        error: e,
        stackTrace: st,
      );

      widget.onFinished(null);
    }
  }
}
