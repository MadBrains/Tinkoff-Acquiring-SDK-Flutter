// ignore_for_file: public_member_api_docs

abstract class WebViewKeys {
  static const String threeDSServerTransId = 'threeDSServerTransID';
  static const String threeDSMethodNotificationURL =
      'threeDSMethodNotificationURL';
  static const String acsTransId = 'acsTransID';
  static const String messageVersion = 'messageVersion';
  static const String challengeWindowSize = 'challengeWindowSize';
  static const String messageType = 'messageType';
  static const String threeDSCompInd = 'threeDSCompInd';
  static const String language = 'language';
  static const String timezone = 'timezone';
  static const String screenHeight = 'screen_height';
  static const String screenWidth = 'screen_width';
  static const String cresCallbackUrl = 'cresCallbackUrl';
}

abstract class WebViewSettings {
  static const String messageType = 'CReq';
  static const String challengeWindowSize = '05';
  static const List<String> cancelActions = <String>[
    'cancel.do',
    'cancel=true',
  ];
}

abstract class WebViewMethods {
  static const String submit3DSAuthorization = 'Submit3DSAuthorization';
  static const String submit3DSAuthorizationV2 = 'Submit3DSAuthorizationV2';
  static const String complete3DSMethodv2 = 'Complete3DSMethodv2';
}
