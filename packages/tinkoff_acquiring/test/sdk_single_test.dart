import 'package:test/test.dart';
import 'package:tinkoff_acquiring/tinkoff_acquiring.dart';

import 'sdk_test_constant.dart';

Future<void> main() async {
  group('SDK Single Tests', () {
    test('addAccountQr', () async {
      final AddAccountQrResponse value = await acquiring.addAccountQr(
        AddAccountQrRequest(
          description: 'test',
          dataType: DataType.image,
        ),
      );
      expect(value.runtimeType, AddAccountQrResponse);
    });

    test('addCard', () async {
      final AddCardResponse value = await acquiring.addCard(
        AddCardRequest(
          customerKey: customerKey,
          checkType: CheckType.no,
          ip: ip,
        ),
      );
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
      final AddCustomerResponse value = await acquiring.addCustomer(
        AddCustomerRequest(
          customerKey: customerKey,
          email: email,
          phone: phone,
          ip: ip,
        ),
      );
      expect(value.runtimeType, AddCustomerResponse);
    });

    test('cancel', () async {
      final CancelResponse value = await acquiring.cancel(
        CancelRequest(
          paymentId: 700000021787,
          amount: amount,
          ip: ip,
        ),
      );
      expect(value.runtimeType, CancelResponse);
    });

    // It makes no sense to run without `Init`
    test('charge', () async {
      final ChargeResponse value = await acquiring.charge(
        ChargeRequest(
          paymentId: 700000021787,
          rebillId: 145919,
          ip: ip,
          sendEmail: true,
          infoEmail: email,
        ),
      );
      expect(value.runtimeType, ChargeResponse);
    });

    // It makes no sense to run without `Init`
    test('chargeQr', () async {
      final ChargeQrResponse value = await acquiring.chargeQr(
        ChargeQrRequest(
          paymentId: 700000021787,
          accountToken: '123ewq',
          ip: ip,
          sendEmail: true,
          infoEmail: email,
        ),
      );
      expect(value.runtimeType, ChargeQrResponse);
    });

    test('check3DSVersion', () async {
      final Check3DSVersionResponse value = await acquiring.check3DSVersion(
        Check3DSVersionRequest(
          paymentId: 700000021787,
          cardData: cardData3DS,
        ),
      );
      expect(value.runtimeType, Check3DSVersionResponse);
    });

    test('checkOrder', () async {
      final CheckOrderResponse value = await acquiring.checkOrder(
        CheckOrderRequest(
          orderId: orderId,
        ),
      );
      expect(value.runtimeType, CheckOrderResponse);
    });

    test('confirm', () async {
      final ConfirmResponse value = await acquiring.confirm(
        ConfirmRequest(
          paymentId: 700000021787,
          amount: amount,
          ip: ip,
        ),
      );
      expect(value.runtimeType, ConfirmResponse);
    });

    // It makes no sense to run without `Init`
    test('finishAuthorize', () async {
      final FinishAuthorizeResponse value = await acquiring.finishAuthorize(
        FinishAuthorizeRequest(
          paymentId: 700000021787,
          cardData: cardDataNo3DS,
          ip: ip,
          sendEmail: true,
          infoEmail: email,
        ),
      );
      expect(value.runtimeType, FinishAuthorizeResponse);
    });

    test('getAccountQrList', () async {
      final GetAccountQrListResponse value = await acquiring.getAccountQrList(
        GetAccountQrListRequest(),
      );
      expect(value.runtimeType, GetAccountQrListResponse);
    });

    test('getAddAccountQrState', () async {
      final GetAddAccountQrStateResponse value =
          await acquiring.getAddAccountQrState(
        GetAddAccountQrStateRequest(
          requestKey: requestKey,
        ),
      );
      expect(value.runtimeType, GetAddAccountQrStateResponse);
    });

    test('getAddCardState', () async {
      final GetAddCardStateResponse value = await acquiring.getAddCardState(
        GetAddCardStateRequest(
          requestKey: requestKey,
        ),
      );
      expect(value.runtimeType, GetAddCardStateResponse);
    });

    test('getCardList', () async {
      final GetCardListResponse value = await acquiring.getCardList(
        GetCardListRequest(
          customerKey: customerKey,
          ip: ip,
        ),
      );
      expect(value.runtimeType, GetCardListResponse);
    });

    test('getCustomer', () async {
      final GetCustomerResponse value = await acquiring.getCustomer(
        GetCustomerRequest(
          customerKey: customerKey,
          ip: ip,
        ),
      );
      expect(value.runtimeType, GetCustomerResponse);
    });

    test('getQr', () async {
      final GetQrResponse value = await acquiring.getQr(
        GetQrRequest(
          paymentId: 700000021787,
          dataType: DataType.image,
        ),
      );
      expect(value.runtimeType, GetQrResponse);
    });

    test('getState', () async {
      final GetStateResponse value = await acquiring.getState(
        GetStateRequest(
          paymentId: 700000021787,
          ip: ip,
        ),
      );
      expect(value.runtimeType, GetStateResponse);
    });

    test('getStaticQr', () async {
      final GetStaticQrResponse value = await acquiring.getStaticQr(
        GetStaticQrRequest(
          dataType: DataType.image,
        ),
      );
      expect(value.runtimeType, GetStaticQrResponse);
    });

    test('init', () async {
      final InitResponse value = await acquiring.init(
        InitRequest(
          orderId: orderId.toString(),
          amount: amount,
          ip: ip,
          description: description,
          language: Language.ru,
          recurrent: 'Y',
          customerKey: customerKey,
          payType: PayType.one,
          receipt: Receipt.ffd105(
            taxation: Taxation.esn,
            items: <Items>[
              Items.ffd105(
                name: 'testItem',
                quantity: 1,
                price: amount,
                amount: amount,
                tax: Tax.vat20,
                paymentMethod: PaymentMethod.fullPayment,
                paymentObject: PaymentObject.composite,
                shopCode: 'shop',
                agentData: AgentData(
                  agentSign: AgentSign.bankPayingAgent,
                  operationName: 'testOperation',
                  phones: const <String>[phone],
                  receiverPhones: const <String>[phone],
                  transferPhones: const <String>[phone],
                  operatorName: 'testOperator',
                  operatorAddress: 'testAddress',
                  operatorInn: 'testtestInn',
                ),
                supplierInfo: SupplierInfo(
                  const <String>[phone],
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
        ),
      );
      expect(value.runtimeType, InitResponse);
    });

    test('qrMembersList', () async {
      final QrMembersListResponse value = await acquiring.qrMembersList(
        QrMembersListRequest(
          paymentId: 700000021787,
        ),
      );
      expect(value.runtimeType, QrMembersListResponse);
    });

    test('removeCard', () async {
      final RemoveCardResponse value = await acquiring.removeCard(
        RemoveCardRequest(
          cardId: 4750,
          customerKey: customerKey,
        ),
      );
      expect(value.runtimeType, RemoveCardResponse);
    });

    test('removeCustomer', () async {
      final RemoveCustomerResponse value = await acquiring.removeCustomer(
        RemoveCustomerRequest(
          customerKey: customerKey,
          ip: ip,
        ),
      );
      expect(value.runtimeType, RemoveCustomerResponse);
    });

    test('resend', () async {
      final ResendResponse value = await acquiring.resend(ResendRequest());
      expect(value.runtimeType, ResendResponse);
    });

    test('resend', () async {
      final SbpPayTestResponse value = await acquiring.sbpPayTest(
        SbpPayTestRequest(
          paymentId: '700000021787',
          isDeadlineExpired: true,
        ),
      );
      expect(value.runtimeType, SbpPayTestResponse);
    });

    test('sendClosingReceipt', () async {
      final SendClosingReceiptResponse value =
          await acquiring.sendClosingReceipt(
        SendClosingReceiptRequest(
          paymentId: 700000021787,
          receipt: Receipt.ffd105(
            taxation: Taxation.esn,
            items: <Items>[
              Items.ffd105(
                name: 'testItem',
                quantity: 1,
                price: amount,
                amount: amount,
                tax: Tax.vat20,
                paymentMethod: PaymentMethod.fullPayment,
                paymentObject: PaymentObject.composite,
                shopCode: 'shop',
                agentData: AgentData(
                  agentSign: AgentSign.bankPayingAgent,
                  operationName: 'testOperation',
                  phones: const <String>[phone],
                  receiverPhones: const <String>[phone],
                  transferPhones: const <String>[phone],
                  operatorName: 'testOperator',
                  operatorAddress: 'testAddress',
                  operatorInn: 'testtestInn',
                ),
                supplierInfo: SupplierInfo(
                  const <String>[phone],
                  'testName',
                  'testtestInn',
                ),
              ),
            ],
            email: email,
          ),
        ),
      );
      expect(value.runtimeType, SendClosingReceiptResponse);
    });
  });
}
