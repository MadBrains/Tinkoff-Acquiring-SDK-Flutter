import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:tinkoff_acquiring/tinkoff_acquiring.dart';
import 'package:tinkoff_acquiring_flutter/src/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'constants.dart';

/// Сбор данных для прохождения 3-D Secure 2.0 Collect
class CollectData {
  /// Конструктор cбора данных для прохождения 3-D Secure 2.0 Collect
  CollectData({
    required this.context,
    required this.onFinished,
    required this.config,
    required this.serverTransId,
    required this.threeDsMethodUrl,
  }) {
    _showDialog(context);
  }

  /// Необходим для встраивания в `widget tree`
  final BuildContext context;

  /// Конфигуратор SDK
  final TinkoffAcquiringConfig config;

  /// Уникальный идентификатор транзакции, генерируемый 3DS-Server,
  /// обязательный параметр для 3DS второй версии
  final String serverTransId;

  /// Дополнительный параметр для 3DS второй версии,
  /// который позволяет пройти этап по сбору данных браузера ACS-ом
  final String threeDsMethodUrl;

  /// Результат проверки
  final void Function(Map<String, String>) onFinished;

  late OverlayEntry _overlayEntry;

  void _showDialog(BuildContext context) {
    final OverlayState? overlayState = Overlay.of(context, rootOverlay: true);
    _overlayEntry = _createOverlayEntry();
    if (overlayState != null) {
      overlayState.insert(_overlayEntry);
    }
  }

  void _hideDialog() {
    _overlayEntry.remove();
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      maintainState: true,
      builder: (BuildContext context) {
        return Positioned(
          top: 0,
          right: 0,
          width: 1,
          height: 1,
          child: _WebViewCollect(
            config: config,
            serverTransId: serverTransId,
            threeDsMethodUrl: threeDsMethodUrl,
            onFinished: (Map<String, String> map) {
              onFinished(map);
              _hideDialog();
            },
          ),
        );
      },
    );
  }
}

class _WebViewCollect extends StatelessWidget {
  const _WebViewCollect({
    Key? key,
    required this.onFinished,
    required this.config,
    required this.serverTransId,
    required this.threeDsMethodUrl,
  }) : super(key: key);

  final TinkoffAcquiringConfig config;
  final String serverTransId;
  final String threeDsMethodUrl;
  final void Function(Map<String, String>) onFinished;

  String get termUrl =>
      Uri.encodeFull(config.apiUrl + WebViewMethods.submit3DSAuthorizationV2);

  String get notificationsUrl =>
      Uri.encodeFull(config.apiUrl + WebViewMethods.complete3DSMethodv2);

  String get createCollectData {
    final Map<String, String> params = <String, String>{
      WebViewKeys.threeDSServerTransId: serverTransId,
      WebViewKeys.threeDSMethodNotificationURL: notificationsUrl,
    };

    return base64WithoutPadding(
            Uint8List.fromList(jsonEncode(params).codeUnits))
        .trim();
  }

  String get collect => '''
      <html>
        <body onload="document.f.submit();">
          <form name="payForm" action="$threeDsMethodUrl" method="POST">
            <input type="hidden" name="threeDSMethodData" value="$createCollectData"/>
          </form>
          <script>
            window.onload = submitForm;
            function submitForm() { payForm.submit(); }
          </script>
        </body>
      </html>
    ''';

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: '',
      gestureNavigationEnabled: true,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        webViewController.loadUrl(Uri.dataFromString(
          collect,
          mimeType: 'text/html',
          encoding: Encoding.getByName('utf-8'),
        ).toString());
      },
      onPageFinished: (String url) async {
        if (url == notificationsUrl) {
          final double screenHeight = MediaQuery.of(context).size.height *
              MediaQuery.of(context).devicePixelRatio;
          final double screenWidth = MediaQuery.of(context).size.width *
              MediaQuery.of(context).devicePixelRatio;

          onFinished(<String, String>{
            WebViewKeys.threeDSCompInd: 'Y',
            WebViewKeys.language:
                Localizations.localeOf(context).toLanguageTag(),
            WebViewKeys.timezone: '${DateTime.now().timeZoneOffset.inMinutes}',
            WebViewKeys.screenHeight: screenHeight.toStringAsFixed(0),
            WebViewKeys.screenWidth: screenWidth.toStringAsFixed(0),
            WebViewKeys.cresCallbackUrl: termUrl,
          });
        }
      },
    );
  }
}
