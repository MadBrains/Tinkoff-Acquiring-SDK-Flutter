// ignore_for_file: public_member_api_docs

abstract class JsonKeys {
  static const String terminalKey = 'TerminalKey';
  static const String customerKey = 'CustomerKey';
  static const String checkType = 'CheckType';
  static const String description = 'Description';
  static const String payForm = 'PayForm';
  static const String ip = 'IP';
  static const String token = 'Token';
  static const String requestKey = 'RequestKey';
  static const String success = 'Success';
  static const String paymentUrl = 'PaymentURL';
  static const String errorCode = 'ErrorCode';
  static const String message = 'Message';
  static const String details = 'Details';
  static const String email = 'Email';
  static const String phone = 'Phone';
  static const String data = 'DATA';
  static const String data2 = 'Data';
  static const String rebillId = 'RebillId';
  static const String cardId = 'CardId';
  static const String status = 'Status';
  static const String cardData = 'CardData';
  static const String receipt = 'Receipt';
  static const String password = 'Password';
  static const String paymentId = 'PaymentId';
  static const String amount = 'Amount';
  static const String orderId = 'OrderId';
  static const String originalAmount = 'OriginalAmount';
  static const String newAmount = 'NewAmount';
  static const String sendEmail = 'SendEmail';
  static const String infoEmail = 'InfoEmail';
  static const String agentSign = 'AgentSign';
  static const String operationName = 'OperationName';
  static const String phones = 'Phones';
  static const String receiverPhones = 'ReceiverPhones';
  static const String transferPhones = 'TransferPhones';
  static const String operatorName = 'OperatorName';
  static const String operatorAddress = 'OperatorAddress';
  static const String operatorInn = 'OperatorInn';
  static const String pan = 'Pan';
  static const String expDate = 'ExpDate';
  static const String cardHolder = 'CardHolder';
  static const String cvv = 'CVV';
  static const String name = 'Name';
  static const String quantity = 'Quantity';
  static const String price = 'Price';
  static const String paymentMethod = 'PaymentMethod';
  static const String paymentObject = 'PaymentObject';
  static const String tax = 'Tax';
  static const String ean13 = 'Ean13';
  static const String shopCode = 'ShopCode';
  static const String agentData = 'AgentData';
  static const String supplierInfo = 'SupplierInfo';
  static const String emailCompany = 'EmailCompany';
  static const String taxation = 'Taxation';
  static const String items = 'Items';
  static const String inn = 'Inn';
  static const String encryptedPaymentData = 'EncryptedPaymentData';
  static const String route = 'Route';
  static const String source = 'Source';
  static const String acsUrl = 'ACSUrl';
  static const String md = 'MD';
  static const String paReq = 'PaReq';
  static const String cardType = 'CardType';
  static const String language = 'Language';
  static const String recurrent = 'Recurrent';
  static const String redirectDueDate = 'RedirectDueDate';
  static const String notificationUrl = 'NotificationUrl';
  static const String successUrl = 'SuccessUrl';
  static const String failUrl = 'FailUrl';
  static const String payType = 'PayType';
  static const String cardInfo = 'CardInfo';
  static const String version = 'Version';
  static const String tdsServerTransId = 'TdsServerTransId';
  static const String tdsServerTransID = 'TdsServerTransID';
  static const String threeDsMethodUrl = 'ThreeDSMethodURL';
  static const String acsTransId = 'AcsTransId';
  static const String fallbackOnTdsV1 = 'FallbackOnTdsV1';
  static const String count = 'Count';
  static const String dataType = 'DataType';
}

abstract class NetworkSettings {
  static const String apiVersion = 'v2';
  static const String apiUrlRelease =
      'https://securepay.tinkoff.ru/$apiVersion/';
  static const String apiUrlDebug =
      'https://rest-api-test.tcsbank.ru/$apiVersion/';

  static const Duration timeout = Duration(seconds: 40);

  static const Map<String, String> headers = <String, String>{
    'content-type': 'application/json',
  };
}

abstract class ApiMethods {
  static const String init = 'Init';
  static const String finishAuthorize = 'FinishAuthorize';
  static const String confirm = 'Confirm';
  static const String cancel = 'Cancel';
  static const String getState = 'GetState';
  static const String resend = 'Resend';
  static const String charge = 'Charge';
  static const String addCustomer = 'AddCustomer';
  static const String getCustomer = 'GetCustomer';
  static const String removeCustomer = 'RemoveCustomer';
  static const String getCardList = 'GetCardList';
  static const String removeCard = 'RemoveCard';
  static const String addCard = 'AddCard';
  static const String attachCard = 'AttachCard';
  static const String check3DSVersion = 'Check3dsVersion';
  static const String sendClosingReceipt = 'SendClosingReceipt';
  static const String getQr = 'GetQr';
  static const String getStaticQr = 'GetStaticQr';
}

abstract class Ignore {
  static const Set<String> ignoredFields = <String>{
    JsonKeys.data,
    JsonKeys.receipt,
    JsonKeys.payForm,
  };
}

abstract class CardSettings {
  static const List<int> defaultRangers = <int>[16];
  static const List<int> unknownRangers = <int>[13, 14, 15, 16, 17, 18, 19];
  static const List<int> maestroRangers = <int>[13, 14, 15, 16, 17, 18, 19];
  static const List<int> mirRanges = <int>[16, 18, 19];

  static final RegExp mirPattern = RegExp('^220[0-4]');
  static final RegExp cardNumberPattern = RegExp(r'^[0-9]+$');
  static final RegExp cardMaskedNumberPattern = RegExp(r'^[0-9*]+$');
  static final RegExp cvcCodePattern = RegExp(r'^[0-9]{3}$');

  static const int maxDateLength = 4;
  static const int maxCvcLength = 3;
}
