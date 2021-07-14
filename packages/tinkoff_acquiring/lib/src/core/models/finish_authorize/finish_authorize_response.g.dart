// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finish_authorize_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinishAuthorizeResponse _$FinishAuthorizeResponseFromJson(
        Map<String, dynamic> json) =>
    FinishAuthorizeResponse(
      status: _$enumDecodeNullable(_$StatusEnumMap, json['Status']),
      success: json['Success'] as bool?,
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
      details: json['Details'] as String?,
      terminalKey: json['TerminalKey'] as String?,
      amount: json['Amount'] as int?,
      orderId: json['OrderId'] as String?,
      paymentId: json['PaymentId'] as String?,
      cardId: json['CardId'] as String?,
      acsUrl: json['ACSUrl'] as String?,
      acsTransId: json['AcsTransId'] as String?,
      md: json['MD'] as String?,
      paReq: json['PaReq'] as String?,
      rebillId: json['RebillId'] as String?,
      fallbackOnTdsV1: json['FallbackOnTdsV1'] as bool?,
      serverTransId: json['TdsServerTransId'] as String?,
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
      'ACSUrl': instance.acsUrl,
      'AcsTransId': instance.acsTransId,
      'MD': instance.md,
      'PaReq': instance.paReq,
      'RebillId': instance.rebillId,
      'FallbackOnTdsV1': instance.fallbackOnTdsV1,
      'TdsServerTransId': instance.serverTransId,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$StatusEnumMap = {
  Status.newest: 'NEW',
  Status.formShowed: 'FORM_SHOWED',
  Status.deadlineExpired: 'DEADLINE_EXPIRED',
  Status.canceled: 'CANCELED',
  Status.preAuthorizing: 'PREAUTHORIZING',
  Status.authorizing: 'AUTHORIZING',
  Status.authorized: 'AUTHORIZED',
  Status.authFail: 'AUTH_FAIL',
  Status.rejected: 'REJECTED',
  Status.threeDsChecking: '3DS_CHECKING',
  Status.threeDsChecked: '3DS_CHECKED',
  Status.reversing: 'REVERSING',
  Status.partialReversed: 'PARTIAL_REVERSED',
  Status.reversed: 'REVERSED',
  Status.confirming: 'CONFIRMING',
  Status.confirmed: 'CONFIRMED',
  Status.refunding: 'REFUNDING',
  Status.partialRefunded: 'PARTIAL_REFUNDED',
  Status.refunded: 'REFUNDED',
};
