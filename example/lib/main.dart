// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:tinkoff_acquiring/tinkoff_acquiring.dart';
import 'package:tinkoff_acquiring_flutter/tinkoff_acquiring_flutter.dart';

void main() {
  runApp(MyApp());
}

const String terminalKey = 'TestSDK';
const String password = '12345678';
const String publicKey =
    'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5Yg3RyEkszggDVMDHCAGzJm0mYpYT53BpasrsKdby8iaWJVACj8ueR0Wj3Tu2BY64HdIoZFvG0v7UqSFztE/zUvnznbXVYguaUcnRdwao9gLUQO2I/097SHF9r++BYI0t6EtbbcWbfi755A1EWfu9tdZYXTrwkqgU9ok2UIZCPZ4evVDEzDCKH6ArphVc4+iKFrzdwbFBmPmwi5Xd6CB9Na2kRoPYBHePGzGgYmtKgKMNs+6rdv5v9VB3k7CS/lSIH4p74/OPRjyryo6Q7NbL+evz0+s60Qz5gbBRGfqCA57lUiB3hfXQZq5/q1YkABOHf9cR6Ov5nTRSOnjORgPjwIDAQAB';

const String customerKey = 'madbrains-user-key';
const int amount = 1400;

final TinkoffAcquiring acquiring = TinkoffAcquiring(
  TinkoffAcquiringConfig.credential(
    terminalKey: terminalKey,
    password: password,
    isDebugMode: true,
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ValueNotifier<bool> threeDs = ValueNotifier<bool>(false);
  ValueNotifier<bool> threeDsV2 = ValueNotifier<bool>(false);
  ValueNotifier<String?> status = ValueNotifier<String?>('');
  ValueNotifier<String?> cardType = ValueNotifier<String?>('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('3DS'),
                ValueListenableBuilder<bool>(
                  valueListenable: threeDs,
                  builder: (BuildContext context, bool value, _) => Switch(
                    value: value,
                    onChanged: (bool v) {
                      if (v) {
                        threeDsV2.value = false;
                      }

                      threeDs.value = v;
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('3DS V2'),
                ValueListenableBuilder<bool>(
                  valueListenable: threeDsV2,
                  builder: (BuildContext context, bool value, _) => Switch(
                    value: value,
                    onChanged: (bool v) {
                      if (v) {
                        threeDs.value = false;
                      }

                      threeDsV2.value = v;
                    },
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            ElevatedButton(
              onPressed: () async {
                await _pay();
              },
              child: const Text('Pay'),
            ),
            ElevatedButton(
              onPressed: () async {
                await cancle();
              },
              child: const Text('Cancle'),
            ),
            ElevatedButton(
              onPressed: () async {
                await state();
              },
              child: const Text('State'),
            ),
            ElevatedButton(
              onPressed: () async {
                await charge();
              },
              child: const Text('charge'),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            ValueListenableBuilder<String?>(
              valueListenable: cardType,
              builder: (BuildContext context, String? value, _) {
                return Text('Card type: $value');
              },
            ),
            ValueListenableBuilder<String?>(
              valueListenable: status,
              builder: (BuildContext context, String? value, _) {
                return Text('Status: \n$value');
              },
            ),
          ],
        ),
      ),
    );
  }

  void reset() {
    status.value = '';
    cardType.value = '';
  }

  bool checkError(AcquiringResponse response) {
    if (response.success == false && response.errorCode != null) {
      status.value = '''
errorCode: ${response.errorCode}
status: ${response.status}
message: ${response.message}
details: ${response.details}
''';
      return true;
    }

    return false;
  }

  Future<void> cancle() async {
    final CancelResponse res = await acquiring
        .cancel(CancelRequest(paymentId: 1191852757, amount: 1500000));

    if (checkError(res)) return;
  }

  Future<void> state() async {
    final GetStateResponse res =
        await acquiring.getState(GetStateRequest(paymentId: 995090973));

    if (checkError(res)) return;
  }

  Future<void> charge() async {
    final ChargeResponse res = await acquiring
        .charge(ChargeRequest(paymentId: 995090973, rebillId: 1642583003390));

    if (checkError(res)) return;
  }

  Future<void> _pay() async {
    reset();

    String cardData = '';

    // Список тестовых карт
    // Вы можете использовать любой срок действия для тестовой карт
    //
    // 3ds 1 & 2
    // 1. Ошибка оплаты, Ошибка при списании: 2201382000000021 / 1225 / 123
    // 2. Ошибка оплаты, Недостаточно средств: 2201382000000831 / 1225 / 123
    // 3. Успешная оплата, 3ds2 Frictionless Flow: 2201382000000013 / 1225 / 123
    // 4. Успешная оплата, 3ds2 Challenge Flow: 2201382000000047 / 1225 / 123 / 1qwezxc
    // 5. Ошибка оплаты, 3ds2 Restricted: 2201382000000005 / 1225 / 123
    // 6. Ошибка оплаты, Frictionless Flow: 2201382000000021 / 1225 / 123
    //
    // No 3ds
    // 1. Успешная оплата, Card not Enrolled (Attempt): 2201382000000039 / 1225 / 123
    // 2. Успешная оплата: 2200770239097761 / 1225 / 123
    // 3. Ошибка оплаты, Недостаточно средств: 4249170392197566 / 1225 / 123
    // 4. Ошибка оплаты, Ошибка при списании: 5586200071492075 / 1225 / 123
    if (threeDs.value) {
      cardType.value = '3ds v1';
      cardData = CardData(
        pan: '2201382000000013',
        expDate: '1225',
        cvv: '123',
      ).encode(publicKey);
    } else if (threeDsV2.value) {
      cardType.value = '3ds v2';
      cardData = CardData(
        pan: '2201382000000047',
        expDate: '1224',
        cvv: '123',
      ).encode(publicKey);
    } else {
      cardType.value = 'non 3ds';
      cardData = CardData(
        pan: '2200770239097761',
        expDate: '1225',
        cvv: '123',
      ).encode(publicKey);
    }

    final InitResponse init = await acquiring.init(
      InitRequest(
        orderId: (99 +
                math.Random(DateTime.now().millisecondsSinceEpoch)
                    .nextInt(100000))
            .toString(),
        customerKey: customerKey,
        amount: amount,
        language: Language.ru,
        payType: PayType.one,
      ),
    );

    if (checkError(init)) return;

    final Check3DSVersionResponse check3DSVersion =
        await acquiring.check3DSVersion(
      Check3DSVersionRequest(
        paymentId: int.parse(init.paymentId!),
        cardData: cardData,
      ),
    );

    if (checkError(check3DSVersion)) return;

    final Completer<Map<String, String>> data =
        Completer<Map<String, String>>();
    if (check3DSVersion.is3DsVersion2) {
      CollectData(
        context: context,
        config: acquiring.config,
        serverTransId: check3DSVersion.serverTransId!,
        threeDsMethodUrl: check3DSVersion.threeDsMethodUrl!,
        onFinished: (Map<String, String> v) {
          data.complete(v);
        },
      );
    } else {
      data.complete(<String, String>{});
    }

    final FinishAuthorizeResponse fa = await acquiring.finishAuthorize(
      FinishAuthorizeRequest(
        paymentId: int.parse(init.paymentId!),
        cardData: cardData,
        data: await data.future,
      ),
    );

    if (checkError(fa)) return;

    final Completer<Submit3DSAuthorizationResponse?> webView =
        Completer<Submit3DSAuthorizationResponse?>();
    if (fa.status == Status.threeDsChecking) {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => Scaffold(
            body: WebView3DS(
              config: acquiring.config,
              is3DsVersion2: fa.is3DsVersion2 || check3DSVersion.is3DsVersion2,
              serverTransId:
                  fa.tdsServerTransId ?? check3DSVersion.serverTransId,
              acsUrl: fa.acsUrl!,
              md: fa.md,
              paReq: fa.paReq,
              acsTransId: fa.acsTransId,
              version: check3DSVersion.version,
              onLoad: (bool v) {
                debugPrint('WebView load: $v');
              },
              onFinished: (Submit3DSAuthorizationResponse? v) {
                Navigator.of(context).pop();
                webView.complete(v);
              },
            ),
          ),
        ),
      );
    } else {
      webView.complete(null);
    }

    status.value = await webView.future.then<String>((_) async {
      final GetStateResponse getState = await acquiring.getState(
        GetStateRequest(
          paymentId: int.parse(init.paymentId!),
        ),
      );

      if (checkError(getState)) return '';

      return getState.status.toString();
    });
  }
}
