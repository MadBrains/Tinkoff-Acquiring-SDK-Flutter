// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_members_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrMembersListResponse _$QrMembersListResponseFromJson(
        Map<String, dynamic> json) =>
    QrMembersListResponse(
      status: $enumDecodeNullable(_$StatusEnumMap, json['Status'],
          unknownValue: Status.notExist),
      success: json['Success'] as bool?,
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
      details: json['Details'] as String?,
      members: (json['Members'] as List<dynamic>?)
          ?.map((e) => Member.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderId: json['OrderId'] as String?,
    );

Map<String, dynamic> _$QrMembersListResponseToJson(
        QrMembersListResponse instance) =>
    <String, dynamic>{
      'Success': instance.success,
      'Status': _$StatusEnumMap[instance.status],
      'ErrorCode': instance.errorCode,
      'Message': instance.message,
      'Details': instance.details,
      'OrderId': instance.orderId,
      'Members': instance.members,
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
