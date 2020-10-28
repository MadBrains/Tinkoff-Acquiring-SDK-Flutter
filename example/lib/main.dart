import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:tinkoff_acquiring/tinkoff_acquiring_core.dart';
import 'package:tinkoff_acquiring/tinkoff_acquiring_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool threeDs = false;
  bool threeDsV2 = false;
  Completer<String> status = Completer<String>();

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
                Switch(
                  value: threeDs,
                  onChanged: (bool v) {
                    setState(() {
                      threeDs = v;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('3DS V2'),
                Switch(
                  value: threeDsV2,
                  onChanged: threeDs
                      ? (bool v) {
                          setState(() {
                            threeDsV2 = v;
                          });
                        }
                      : null,
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            RaisedButton(
              onPressed: () {
                if (status.isCompleted) reset();
                status.complete(_pay());
              },
              child: const Text('Pay'),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            FutureBuilder<String>(
              future: status.future,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (!snapshot.hasError &&
                    snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return Text(snapshot.data);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void reset() {
    setState(() {
      status = Completer<String>();
    });
  }

  Future<String> _pay() async {
    const String terminalKey = 'TestSDK';
    const String password = '12345678';
    const String publicKey =
        'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5Yg3RyEkszggDVMDHCAGzJm0mYpYT53BpasrsKdby8iaWJVACj8ueR0Wj3Tu2BY64HdIoZFvG0v7UqSFztE/zUvnznbXVYguaUcnRdwao9gLUQO2I/097SHF9r++BYI0t6EtbbcWbfi755A1EWfu9tdZYXTrwkqgU9ok2UIZCPZ4evVDEzDCKH6ArphVc4+iKFrzdwbFBmPmwi5Xd6CB9Na2kRoPYBHePGzGgYmtKgKMNs+6rdv5v9VB3k7CS/lSIH4p74/OPRjyryo6Q7NbL+evz0+s60Qz5gbBRGfqCA57lUiB3hfXQZq5/q1YkABOHf9cR6Ov5nTRSOnjORgPjwIDAQAB';

    const String customerKey = 'user-key';
    const int amount = 1400;
    String cardData = '';

    if (threeDs) {
      if (threeDsV2) {
        // a. Issuer not enrolled 2201382000000062/1220/any
        // b. Card not enrolled, Attempt 2201382000000039/1220/any
        // c. Card enrolled, frictionless 2201382000000013/1220/any
        // d. Restricted, 2201382000000005/1220/any
        // e. Challenge(пароль на ACS 1qwezxc), 2201382000000047/1220/any
        cardData = CardData(
          2201382000000047,
          '1220',
          '123',
          cardHolder: 'T. TESTING',
        ).encode(publicKey);
      } else {
        // 3ds v1
        cardData = CardData(
          5411420000000002,
          '1122',
          '111',
          cardHolder: 'T. TESTING',
        ).encode(publicKey);
      }
    } else {
      cardData = CardData(
        4300000000000777,
        '1122',
        '111',
        cardHolder: 'T. TESTING',
      ).encode(publicKey);
    }

    final TinkoffAcquiring acquiring = TinkoffAcquiring(
      terminalKey: terminalKey,
      password: password,
    );

    final InitResponse init = await acquiring.init(InitRequest(
      (99 + math.Random(DateTime.now().millisecondsSinceEpoch).nextInt(100000))
          .toString(),
      customerKey: customerKey,
      amount: amount,
      language: Language.ru,
      payType: PayType.one,
    ));

    final Check3DSVersionResponse check3DSVersion =
        await acquiring.check3DSVersion(Check3DSVersionRequest(
      int.parse(init.paymentId),
      cardData,
    ));

    final Completer<Map<String, String>> data =
        Completer<Map<String, String>>();
    if (check3DSVersion.is3DsVersion2) {
      CollectData(
        context: context,
        acquiring: acquiring,
        serverTransId: check3DSVersion.serverTransId,
        threeDsMethodUrl: check3DSVersion.threeDsMethodUrl,
        onFinished: (Map<String, String> v) {
          data.complete(v);
        },
      );
    } else {
      data.complete(null);
    }

    final FinishAuthorizeResponse fa =
        await acquiring.finishAuthorize(FinishAuthorizeRequest(
      int.parse(init.paymentId),
      cardData: cardData,
      data: await data.future,
    ));

    final Completer<Submit3DSAuthorizationResponse> webView =
        Completer<Submit3DSAuthorizationResponse>();
    if (fa.status == Status.threeDsChecking) {
      Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (BuildContext context) => Scaffold(
          body: WebView3DS(
            acquiring: acquiring,
            is3DsVersion2: fa.is3DsVersion2 || check3DSVersion.is3DsVersion2,
            serverTransId: fa.serverTransId ?? check3DSVersion.serverTransId,
            acsUrl: fa.acsUrl,
            md: fa.md,
            paReq: fa.paReq,
            acsTransId: fa.acsTransId,
            version: check3DSVersion.version,
            onLoad: (bool v) {
              acquiring.logger.log('WebView load: $v');
            },
            onFinished: (Submit3DSAuthorizationResponse v) {
              Navigator.of(context).pop();
              webView.complete(v);
            },
          ),
        ),
      ));
    } else {
      webView.complete(null);
    }

    return webView.future.then((_) async {
      final GetStateResponse getState = await acquiring.getState(
        GetStateRequest(int.parse(init.paymentId)),
      );

      return getState.status.toString();
    });
  }
}
