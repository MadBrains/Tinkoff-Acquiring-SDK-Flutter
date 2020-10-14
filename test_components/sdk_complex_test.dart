import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';

import 'package:tinkoff_acquiring/tinkoff_acquiring_core.dart';

import 'sdk_test_constant.dart';

void start() {
  setUp(() async {
    await Future<void>.delayed(const Duration(seconds: 5)).then((_) {});
    await acquiring.removeCard(RemoveCardRequest(cardId, customerKey));
    await acquiring.removeCustomer(RemoveCustomerRequest(
      customerKey,
      ip: ip,
    ));
  });

  test('complex', () async {
    final AddCustomerResponse addConsumer =
        await acquiring.addCustomer(AddCustomerRequest(
      customerKey,
      email: email,
      phone: phone,
      ip: ip,
    ));
    expect(addConsumer.success, true);

    final GetCustomerResponse getCustomer =
        await acquiring.getCustomer(GetCustomerRequest(
      customerKey,
      ip: ip,
    ));
    expect(getCustomer.success, true);
    expect(phone, getCustomer.phone);

    final AddCardResponse addCard = await acquiring.addCard(AddCardRequest(
      customerKey,
      checkType: CheckType.no,
      description: description,
      payForm: payForm,
      ip: ip,
    ));
    expect(addCard.success, true);

    final AttachCardResponse attachCard =
        await acquiring.attachCard(AttachCardRequest(
      addCard.requestKey.toString(),
      cardDataNo3DS,
    ));
    expect(attachCard.success, true);

    final GetCardListResponse getCardList =
        await acquiring.getCardList(GetCardListRequest(
      customerKey,
      ip: ip,
    ));
    expect(getCardList.cardInfo.first.status, CardStatus.active);

    /*------------------------Normal------------------------*/

    final InitResponse init = await acquiring.init(InitRequest(
      (orderId +
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
      int.parse(init.paymentId),
      cardData: cardDataNo3DS,
    ));
    expect(finishAuthorize.success, true);

    final GetStateResponse getState = await acquiring.getState(GetStateRequest(
      int.parse(init.paymentId),
      ip: ip,
    ));
    expect(getState.success, true);

    if (getState.status == Status.authorized) {
      final ConfirmResponse value = await acquiring.confirm(ConfirmRequest(
        int.parse(getState.paymentId),
        amount: amount,
        ip: ip,
      ));
      expect(value.success, true);
    }

    /*------------------------Cancel------------------------*/

    final InitResponse init2 = await acquiring.init(InitRequest(
      (orderId +
              math.Random(DateTime.now().millisecondsSinceEpoch)
                  .nextInt(100000))
          .toString(),
      customerKey: getCustomer.customerKey,
      amount: amount,
    ));
    expect(init2.success, true);

    final CancelResponse cancel = await acquiring.cancel(CancelRequest(
      int.parse(init2.paymentId),
      amount: amount,
    ));
    expect(cancel.success, true);

    /*------------------------Recurrent------------------------*/

    final InitResponse init3 = await acquiring.init(InitRequest(
      (orderId +
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
      int.parse(init3.paymentId),
      cardData: cardDataNo3DS,
    ));
    expect(finishAuthorize2.success, true);

    final InitResponse init4 = await acquiring.init(InitRequest(
      (orderId +
              math.Random(DateTime.now().millisecondsSinceEpoch)
                  .nextInt(100000))
          .toString(),
      customerKey: getCustomer.customerKey,
      amount: amount,
    ));
    expect(init4.success, true);

    final ChargeResponse value = await acquiring.charge(ChargeRequest(
      int.parse(init4.paymentId),
      int.parse(finishAuthorize2.rebillId),
    ));
    expect(value.success, true);
  }, timeout: const Timeout(Duration(seconds: 300)));
}
