import 'package:tinkoff_acquiring/tinkoff_acquiring.dart';

const int orderId = 990100;
const String terminalKey = 'TestSDK';
const String password = '12345678';
const String customerKey = 'user-key';
const String payForm = 'Checkout';
const int amount = 1400;
const String ip = '127.0.0.1';
const String email = 'test@gmail.com';
const String phone = '+78005553535';
const String description =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';
const int cardId = 4034;

const String publicKey =
    'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5Yg3RyEkszggDVMDHCAGzJm0mYpYT53BpasrsKdby8iaWJVACj8ueR0Wj3Tu2BY64HdIoZFvG0v7UqSFztE/zUvnznbXVYguaUcnRdwao9gLUQO2I/097SHF9r++BYI0t6EtbbcWbfi755A1EWfu9tdZYXTrwkqgU9ok2UIZCPZ4evVDEzDCKH6ArphVc4+iKFrzdwbFBmPmwi5Xd6CB9Na2kRoPYBHePGzGgYmtKgKMNs+6rdv5v9VB3k7CS/lSIH4p74/OPRjyryo6Q7NbL+evz0+s60Qz5gbBRGfqCA57lUiB3hfXQZq5/q1YkABOHf9cR6Ov5nTRSOnjORgPjwIDAQAB';

final String cardDataNo3DS = CardData(
  pan: '2201382000000005',
  expDate: '1224',
  cvv: '123',
  cardHolder: 'T. TESTING',
).encode(publicKey);

// For mobile, use password: 1234
// For web, use password: password
// ACS 1qwezxc
final String cardData3DS = CardData(
  pan: '2201382000000047',
  expDate: '1224',
  cvv: '123',
  cardHolder: 'T. TESTING',
).encode(publicKey);

final TinkoffAcquiring acquiring = TinkoffAcquiring(
  TinkoffAcquiringConfig.credential(
    terminalKey: terminalKey,
    password: password,
  ),
);
