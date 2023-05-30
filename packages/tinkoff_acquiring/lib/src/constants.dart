// ignore_for_file: public_member_api_docs

abstract final class JsonKeys {
  static const String terminalKey = 'TerminalKey';
  static const String customerKey = 'CustomerKey';
  static const String checkType = 'CheckType';
  static const String description = 'Description';
  static const String currency = 'Currency';
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
  static const String shops = 'Shops';
  static const String receipts = 'Receipts';
  static const String fee = 'Fee';
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
  static const String eci = 'ECI';
  static const String cavv = 'CAVV';
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
  static const String notificationUrl = 'NotificationURL';
  static const String successUrl = 'SuccessURL';
  static const String failUrl = 'FailURL';
  static const String payType = 'PayType';
  static const String cardInfo = 'CardInfo';
  static const String version = 'Version';
  static const String tdsServerTransId = 'TdsServerTransId';
  static const String tdsServerTransID = 'TdsServerTransID';
  static const String threeDsMethodUrl = 'ThreeDSMethodURL';
  static const String acsTransId = 'AcsTransId';
  static const String acsInterface = 'AcsInterface';
  static const String acsUiTemplate = 'AcsUiTemplate';
  static const String acsSignedContent = 'AcsSignedContent';
  static const String acsReferenceNumber = 'AcsReferenceNumber';
  static const String sdkTransID = 'SdkTransID';
  static const String fallbackOnTdsV1 = 'FallbackOnTdsV1';
  static const String count = 'Count';
  static const String dataType = 'DataType';
  static const String ffdVersion = 'FfdVersion';
  static const String payments = 'Payments';
  static const String customer = 'Customer';
  static const String customerInn = 'CustomerInn';
  static const String clientInfo = 'ClientInfo';
  static const String descriptor = 'Descriptor';
  static const String userData = 'UserData';
  static const String markCodeType = 'MarkCodeType';
  static const String value = 'Value';
  static const String numerator = 'numerator';
  static const String denominator = 'denominator';
  static const String federalId = 'FederalId';
  static const String date = 'Date';
  static const String number = 'Number';
  static const String excise = 'Excise';
  static const String countryCode = 'CountryCode';
  static const String declarationNumber = 'DeclarationNumber';
  static const String measurementUnit = 'MeasurementUnit';
  static const String markProcessingMode = 'MarkProcessingMode';
  static const String markCode = 'MarkCode';
  static const String markQuantity = 'MarkQuantity';
  static const String sectoralItemProps = 'SectoralItemProps';
  static const String cash = 'Cash';
  static const String electronic = 'Electronic';
  static const String advancePayment = 'AdvancePayment';
  static const String credit = 'Credit';
  static const String provision = 'Provision';
  static const String birthdate = 'Birthdate';
  static const String citizenship = 'citizenship';
  static const String documentCode = 'DocumentСode';
  static const String documentData = 'DocumentData';
  static const String address = 'Address';
  static const String paymentSystem = 'PaymentSystem';
  static const String rrn = 'RRN';
  static const String memberId = 'MemberId';
  static const String memberName = 'MemberName';
  static const String isPayee = 'IsPayee';
  static const String members = 'Members';
  static const String accountToken = 'AccountToken';
  static const String bankMemberId = 'BankMemberId';
  static const String bankMemberName = 'BankMemberName';
  static const String accountTokens = 'AccountTokens';
  static const String isDeadlineExpired = 'IsDeadlineExpired';
  static const String isRejected = 'IsRejected';
  static const String notificationTypes = 'NotificationTypes';
  static const String residentState = 'ResidentState';
  static const String qrMemberId = 'QrMemberId';
  static const String operatingCheckProps = 'OperatingCheckProps';
  static const String sectoralCheckProps = 'SectoralCheckProps';
  static const String addUserProp = 'AddUserProp';
  static const String additionalCheckProps = 'AdditionalCheckProps';
  static const String timestamp = 'Timestamp';
}

abstract final class NetworkSettings {
  static const String domainDebug = 'rest-api-test.tinkoff.ru';
  static const String domainRelease = 'securepay.tinkoff.ru';
  static const String apiPath = '/';
  static const String apiVersion2 = 'v2';
  static const String apiVersionCashbox = 'cashbox';

  static const Duration timeout = Duration(seconds: 40);

  static const String contentType = 'content-type';
  static const String contentTypeJson = 'application/json';
  static const Map<String, String> baseHeaders = <String, String>{
    contentType: contentTypeJson,
  };
}

abstract final class ApiMethods {
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
  static const String checkOrder = 'CheckOrder';
  static const String qrMembersList = 'QrMembersList';
  static const String addAccountQr = 'AddAccountQr';
  static const String chargeQr = 'ChargeQr';
  static const String getAddAccountQrState = 'GetAddAccountQrState';
  static const String getAccountQrList = 'GetAccountQrList';
  static const String sbpPayTest = 'SbpPayTest';
  static const String getAddCardState = 'GetAddCardState';
}

abstract final class Ignore {
  static const Set<String> ignoredFields = <String>{
    JsonKeys.data,
    JsonKeys.receipt,
    JsonKeys.receipts,
    JsonKeys.shops,
  };
}

abstract final class CardSettings {
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
