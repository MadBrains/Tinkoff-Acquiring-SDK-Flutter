// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_3ds_version_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Check3DSVersionResponse _$Check3DSVersionResponseFromJson(
        Map<String, dynamic> json) =>
    Check3DSVersionResponse(
      status: $enumDecodeNullable(_$StatusEnumMap, json['Status']),
      success: json['Success'] as bool?,
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
      details: json['Details'] as String?,
      version: json['Version'] as String?,
      serverTransId: json['TdsServerTransID'] as String?,
      threeDsMethodUrl: json['ThreeDSMethodURL'] as String?,
    );

Map<String, dynamic> _$Check3DSVersionResponseToJson(
        Check3DSVersionResponse instance) =>
    <String, dynamic>{
      'Success': instance.success,
      'Status': _$StatusEnumMap[instance.status],
      'ErrorCode': instance.errorCode,
      'Message': instance.message,
      'Details': instance.details,
      'Version': instance.version,
      'TdsServerTransID': instance.serverTransId,
      'ThreeDSMethodURL': instance.threeDsMethodUrl,
    };

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
