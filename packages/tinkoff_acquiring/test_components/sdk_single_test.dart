import 'package:test/test.dart';

import 'package:tinkoff_acquiring/tinkoff_acquiring.dart';

import 'sdk_test_constant.dart';

void start() {
  test('addCard', () async {
    final AddCardResponse value = await acquiring.addCard(AddCardRequest(
      customerKey: customerKey,
      checkType: CheckType.no,
      description: description,
      payForm: payForm,
      ip: ip,
    ));
    expect(value.runtimeType, AddCardResponse);
  });

  // It makes no sense to run without `AddCard`
  // test('attachCard', () async {
  //   final AttachCardResponse value =
  //       await acquiring.attachCard(AttachCardRequest(
  //     requestKey,
  //     cardData,
  //   ));
  //   expect(value.runtimeType, AttachCardResponse);
  // });

  test('addCustomer', () async {
    final AddCustomerResponse value =
        await acquiring.addCustomer(AddCustomerRequest(
      customerKey: customerKey,
      email: email,
      phone: phone,
      ip: ip,
    ));
    expect(value.runtimeType, AddCustomerResponse);
  });

  test('cancel', () async {
    final CancelResponse value = await acquiring.cancel(CancelRequest(
      paymentId: 700000021787,
      amount: amount,
      ip: ip,
    ));
    expect(value.runtimeType, CancelResponse);
  });

  // It makes no sense to run without `Init`
  // test('charge', () async {
  //   final ChargeResponse value = await acquiring.charge(ChargeRequest(
  //     700000021787,
  //     145919,
  //   ));
  //   expect(value.runtimeType, ChargeResponse);
  // });

  test('confirm', () async {
    final ConfirmResponse value = await acquiring.confirm(ConfirmRequest(
      paymentId: 700000021787,
      amount: amount,
      ip: ip,
    ));
    expect(value.runtimeType, ConfirmResponse);
  });

  // It makes no sense to run without `Init`
  // test('finishAuthorize', () async {
  //   final FinishAuthorizeResponse value =
  //       await acquiring.finishAuthorize(FinishAuthorizeRequest(
  //     700000021787,
  //     cardData: cardData,
  //   ));
  //   expect(value.runtimeType, FinishAuthorizeResponse);
  // });

  test('check3DSVersion', () async {
    final Check3DSVersionResponse value =
        await acquiring.check3DSVersion(Check3DSVersionRequest(
      paymentId: 700000021787,
      cardData: cardData3DS,
    ));
    expect(value.runtimeType, Check3DSVersionResponse);
  });

  test('getCardList', () async {
    final GetCardListResponse value =
        await acquiring.getCardList(GetCardListRequest(
      customerKey: customerKey,
      ip: ip,
    ));
    expect(value.runtimeType, GetCardListResponse);
  });

  test('getCustomer', () async {
    final GetCustomerResponse value =
        await acquiring.getCustomer(GetCustomerRequest(
      customerKey: customerKey,
      ip: ip,
    ));
    expect(value.runtimeType, GetCustomerResponse);
  });

  test('getState', () async {
    final GetStateResponse value = await acquiring.getState(GetStateRequest(
      paymentId: 700000021787,
      ip: ip,
    ));
    expect(value.runtimeType, GetStateResponse);
  });

  test('init', () async {
    final InitResponse value = await acquiring.init(InitRequest(
      orderId: orderId.toString(),
      amount: amount,
      ip: ip,
      description: description,
      language: Language.ru,
      recurrent: 'Y',
      customerKey: customerKey,
      payType: PayType.one,
      receipt: Receipt(
        taxation: Taxation.esn,
        items: <Items>[
          Items(
            name: 'testItem',
            quantity: '1',
            price: amount.toString(),
            amount: amount.toString(),
            tax: Tax.vat20,
            paymentMethod: PaymentMethod.fullPayment,
            paymentObject: PaymentObject.composite,
            shopCode: 'shop',
            agentData: AgentData(
              agentSign: AgentSign.bankPayingAgent,
              operationName: 'testOperation',
              phones: <String>[phone],
              receiverPhones: <String>[phone],
              transferPhones: <String>[phone],
              operatorName: 'testOperator',
              operatorAddress: 'testAddress',
              operatorInn: 'testtestInn',
            ),
            supplierInfo: SupplierInfo(
              <String>[phone],
              'testName',
              'testtestInn',
            ),
          ),
        ],
        email: email,
      ),
      data: const <String, String>{
        'Phone': '+71234567890',
        'Email': 'a@test.com',
      },
    ));
    expect(value.runtimeType, InitResponse);
  });

  test('removeCard', () async {
    final RemoveCardResponse value =
        await acquiring.removeCard(RemoveCardRequest(
      cardId: 4750,
      customerKey: customerKey,
    ));
    expect(value.runtimeType, RemoveCardResponse);
  });

  test('removeCustomer', () async {
    final RemoveCustomerResponse value =
        await acquiring.removeCustomer(RemoveCustomerRequest(
      customerKey: customerKey,
      ip: ip,
    ));
    expect(value.runtimeType, RemoveCustomerResponse);
  });

  test('resend', () async {
    final ResendResponse value = await acquiring.resend(ResendRequest());
    expect(value.runtimeType, ResendResponse);
  });

  test('sendClosingReceipt', () async {
    final SendClosingReceiptResponse value =
        await acquiring.sendClosingReceipt(SendClosingReceiptRequest(
      paymentId: 700000021787,
      receipt: Receipt(
        taxation: Taxation.esn,
        items: <Items>[
          Items(
            name: 'testItem',
            quantity: '1',
            price: amount.toString(),
            amount: amount.toString(),
            tax: Tax.vat20,
            paymentMethod: PaymentMethod.fullPayment,
            paymentObject: PaymentObject.composite,
            shopCode: 'shop',
            agentData: AgentData(
              agentSign: AgentSign.bankPayingAgent,
              operationName: 'testOperation',
              phones: <String>[phone],
              receiverPhones: <String>[phone],
              transferPhones: <String>[phone],
              operatorName: 'testOperator',
              operatorAddress: 'testAddress',
              operatorInn: 'testtestInn',
            ),
            supplierInfo: SupplierInfo(
              <String>[phone],
              'testName',
              'testtestInn',
            ),
          ),
        ],
        email: email,
      ),
    ));
    expect(value.runtimeType, SendClosingReceiptResponse);
  });

  test('GetQr', () async {
    final GetQrResponse value = await acquiring.getQr(GetQrRequest(
      paymentId: 700000021787,
      dataType: DataType.payload,
    ));
    expect(value.runtimeType, GetQrResponse);
  });

  test('GetStaticQr', () async {
    final GetStaticQrResponse value =
        await acquiring.getStaticQr(GetStaticQrRequest(
      dataType: DataType.payload,
    ));
    expect(value.runtimeType, GetStaticQrResponse);
  });
}
