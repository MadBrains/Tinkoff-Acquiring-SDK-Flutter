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
      cardData = CardData(
        5411420000000002,
        '1122',
        '111',
        cardHolder: 'T. TESTING',
      ).encode(publicKey);
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

    final FinishAuthorizeResponse fa =
        await acquiring.finishAuthorize(FinishAuthorizeRequest(
      int.parse(init.paymentId),
      cardData: cardData,
    ));

    if (fa.status == Status.threeDsChecking) {
      final Completer<Submit3DSAuthorizationResponse> completer =
          Completer<Submit3DSAuthorizationResponse>();
      Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (BuildContext context) => Scaffold(
          body: WebView3DS(
            acquiring: acquiring,
            acsUrl: fa.acsUrl,
            md: fa.md,
            paReq: fa.paReq,
            onLoad: (_) {},
            onFinished: (Submit3DSAuthorizationResponse v) {
              Navigator.of(context).pop();
              completer.complete(v);
            },
          ),
        ),
      ));

      return completer.future.then((Submit3DSAuthorizationResponse v) {
        return v.status.toString();
      });
    } else {
      return fa.status.toString();
    }
  }
}
