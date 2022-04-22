import 'dart:math' as math;

import 'package:test/test.dart';
import 'package:tinkoff_acquiring/tinkoff_acquiring.dart';

import 'sdk_test_constant.dart';

int _parsePaymentId(String? paymentId) {
  return int.parse(paymentId!);
}

void start() {
  final bool is3DS =
      math.Random(DateTime.now().millisecondsSinceEpoch).nextBool();

  setUp(() async {
    await Future<void>.delayed(const Duration(seconds: 5)).then((_) {});
    await acquiring.removeCard(
        RemoveCardRequest(cardId: cardId, customerKey: customerKey));
    await acquiring.removeCustomer(RemoveCustomerRequest(
      customerKey: customerKey,
      ip: ip,
    ));
  });

  test('complex', () async {
    final AddCustomerResponse addConsumer =
        await acquiring.addCustomer(AddCustomerRequest(
      customerKey: customerKey,
      email: email,
      phone: phone,
      ip: ip,
    ));
    expect(addConsumer.success, true);

    final GetCustomerResponse getCustomer =
        await acquiring.getCustomer(GetCustomerRequest(
      customerKey: customerKey,
      ip: ip,
    ));
    expect(getCustomer.success, true);
    expect(phone, getCustomer.phone);

    final AddCardResponse addCard = await acquiring.addCard(AddCardRequest(
      customerKey: customerKey,
      checkType: CheckType.no,
      description: description,
      payForm: payForm,
      ip: ip,
    ));
    expect(addCard.success, true);

    final AttachCardResponse attachCard =
        await acquiring.attachCard(AttachCardRequest(
      requestKey: addCard.requestKey.toString(),
      cardData: is3DS ? cardData3DS : cardDataNo3DS,
    ));
    expect(attachCard.success, true);

    final GetCardListResponse getCardList =
        await acquiring.getCardList(GetCardListRequest(
      customerKey: customerKey,
      ip: ip,
    ));
    expect(getCardList.cardInfo?.first.status, CardStatus.active);

    /*------------------------Normal------------------------*/

    final InitResponse init = await acquiring.init(InitRequest(
      orderId: (orderId +
              math.Random(DateTime.now().millisecondsSinceEpoch)
                  .nextInt(100000))
          .toString(),
      customerKey: getCustomer.customerKey,
      amount: amount,
      ip: ip,
      description: description,
      language: Language.ru,
      payType: PayType.one,
    ));
    expect(init.success, true);

    final ResendResponse resend = await acquiring.resend(ResendRequest());
    expect(resend.success, true);

    final FinishAuthorizeResponse finishAuthorize =
        await acquiring.finishAuthorize(FinishAuthorizeRequest(
      paymentId: _parsePaymentId(init.paymentId),
      cardData: AttachedCardData.card(
              cardId: getCardList.cardInfo?.first.cardId, cvv: '111')
          .encode(publicKey),
    ));
    expect(finishAuthorize.success, true);

    if (finishAuthorize.status == Status.threeDsChecking) {
      final Check3DSVersionResponse check3DSVersion =
          await acquiring.check3DSVersion(Check3DSVersionRequest(
        paymentId: _parsePaymentId(init.paymentId),
        cardData: AttachedCardData.card(
                cardId: getCardList.cardInfo?.first.cardId, cvv: '111')
            .encode(publicKey),
      ));
      expect(check3DSVersion.success, true);
    }

    final GetStateResponse getState = await acquiring.getState(GetStateRequest(
      paymentId: _parsePaymentId(init.paymentId),
      ip: ip,
    ));
    expect(getState.success, true);

    if (getState.status == Status.authorized) {
      final ConfirmResponse value = await acquiring.confirm(ConfirmRequest(
        paymentId: _parsePaymentId(getState.paymentId),
        amount: amount,
        ip: ip,
      ));
      expect(value.success, true);
    }

    /*------------------------Cancel------------------------*/

    final InitResponse init2 = await acquiring.init(InitRequest(
      orderId: (orderId +
              math.Random(DateTime.now().millisecondsSinceEpoch)
                  .nextInt(100000))
          .toString(),
      customerKey: getCustomer.customerKey,
      amount: amount,
    ));
    expect(init2.success, true);

    final CancelResponse cancel = await acquiring.cancel(CancelRequest(
      paymentId: _parsePaymentId(init2.paymentId),
      amount: amount,
    ));
    expect(cancel.success, true);

    /*------------------------Recurrent------------------------*/

    final InitResponse init3 = await acquiring.init(InitRequest(
      orderId: (orderId +
              math.Random(DateTime.now().millisecondsSinceEpoch)
                  .nextInt(100000))
          .toString(),
      customerKey: getCustomer.customerKey,
      recurrent: 'Y',
      amount: amount,
    ));
    expect(init3.success, true);

    final FinishAuthorizeResponse finishAuthorize2 =
        await acquiring.finishAuthorize(FinishAuthorizeRequest(
      paymentId: _parsePaymentId(init3.paymentId),
      cardData: cardDataNo3DS,
    ));
    expect(finishAuthorize2.success, true);

    final InitResponse init4 = await acquiring.init(InitRequest(
      orderId: (orderId +
              math.Random(DateTime.now().millisecondsSinceEpoch)
                  .nextInt(100000))
          .toString(),
      customerKey: getCustomer.customerKey,
      amount: amount,
    ));
    expect(init4.success, true);

    final ChargeResponse value = await acquiring.charge(ChargeRequest(
      paymentId: _parsePaymentId(init4.paymentId),
      rebillId: _parsePaymentId(finishAuthorize2.rebillId),
    ));
    expect(value.success, true);

    /*------------------------QR------------------------*/

    final InitResponse init5 = await acquiring.init(InitRequest(
      orderId: (orderId +
              math.Random(DateTime.now().millisecondsSinceEpoch)
                  .nextInt(100000))
          .toString(),
      customerKey: getCustomer.customerKey,
      amount: amount,
    ));
    expect(init5.success, true);

    final GetQrResponse qr = await acquiring.getQr(GetQrRequest(
      paymentId: _parsePaymentId(init5.paymentId),
      dataType: DataType.payload,
    ));
    expect(qr.success, true);

    final GetStaticQrResponse staticQr =
        await acquiring.getStaticQr(GetStaticQrRequest(
      dataType: DataType.payload,
    ));

    expect(staticQr.success, true);
  }, timeout: const Timeout(Duration(seconds: 300)));
}
