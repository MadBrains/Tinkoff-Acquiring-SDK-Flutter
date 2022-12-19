// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finish_authorize_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinishAuthorizeResponse _$FinishAuthorizeResponseFromJson(
        Map<String, dynamic> json) =>
    FinishAuthorizeResponse(
      status: $enumDecodeNullable(_$StatusEnumMap, json['Status'],
          unknownValue: Status.notExist),
      success: json['Success'] as bool?,
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
      details: json['Details'] as String?,
      terminalKey: json['TerminalKey'] as String?,
      orderId: json['OrderId'] as String?,
      amount: json['Amount'] as int?,
      paymentId: json['PaymentId'] as String?,
      rebillId: json['RebillId'] as String?,
      cardId: json['CardId'] as String?,
      md: json['MD'] as String?,
      paReq: json['PaReq'] as String?,
      fallbackOnTdsV1: json['FallbackOnTdsV1'] as bool?,
      tdsServerTransId: json['TdsServerTransId'] as String?,
      acsUrl: json['ACSUrl'] as String?,
      acsTransId: json['AcsTransId'] as String?,
      acsInterface: json['AcsInterface'] as String?,
      acsUiTemplate: json['AcsUiTemplate'] as String?,
      acsSignedContent: json['AcsSignedContent'] as String?,
      acsReferenceNumber: json['AcsReferenceNumber'] as String?,
      sdkTransID: json['SdkTransID'] as String?,
    );

Map<String, dynamic> _$FinishAuthorizeResponseToJson(
        FinishAuthorizeResponse instance) =>
    <String, dynamic>{
      'Success': instance.success,
      'Status': _$StatusEnumMap[instance.status],
      'ErrorCode': instance.errorCode,
      'Message': instance.message,
      'Details': instance.details,
      'TerminalKey': instance.terminalKey,
      'OrderId': instance.orderId,
      'Amount': instance.amount,
      'PaymentId': instance.paymentId,
      'CardId': instance.cardId,
      'MD': instance.md,
      'PaReq': instance.paReq,
      'RebillId': instance.rebillId,
      'FallbackOnTdsV1': instance.fallbackOnTdsV1,
      'TdsServerTransId': instance.tdsServerTransId,
      'ACSUrl': instance.acsUrl,
      'AcsTransId': instance.acsTransId,
      'AcsInterface': instance.acsInterface,
      'AcsUiTemplate': instance.acsUiTemplate,
      'AcsSignedContent': instance.acsSignedContent,
      'AcsReferenceNumber': instance.acsReferenceNumber,
      'SdkTransID': instance.sdkTransID,
    };

const _$StatusEnumMap = {
  Status.notExist: 'notExist',
  Status.newest: 'NEW',
  Status.formShowed: 'FORM_SHOWED',
  Status.deadlineExpired: 'DEADLINE_EXPIRED',
  Status.canceled: 'CANCELED',
  Status.preAuthorizing: 'PREAUTHORIZING',
  Status.authorizing: 'AUTHORIZING',
  Status.authFail: 'AUTH_FAIL',
  Status.rejected: 'REJECTED',
  Status.threeDsChecking: '3DS_CHECKING',
  Status.threeDsChecked: '3DS_CHECKED',
  Status.payChecked: 'PAY_CHECKING',
  Status.authorized: 'AUTHORIZED',
  Status.reversing: 'REVERSING',
  Status.partialReversed: 'PARTIAL_REVERSED',
  Status.reversed: 'REVERSED',
  Status.confirming: 'CONFIRMING',
  Status.confirmChecking: 'CONFIRM_CHECKING',
  Status.confirmed: 'CONFIRMED',
  Status.refunding: 'REFUNDING',
  Status.asyncRefunding: 'ASYNC_REFUNDING',
  Status.partialRefunded: 'PARTIAL_REFUNDED',
  Status.refunded: 'REFUNDED',
  Status.unknown: 'UNKNOWN',
  Status.loopChecking: 'LOOP_CHECKING',
  Status.loopChecked: 'LOOP_CHECKED',
  Status.completed: 'COMPLETED',
  Status.proccesing: 'PROCCESING',
  Status.active: 'ACTIVE',
  Status.inacitve: 'INACITVE',
};
