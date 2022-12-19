// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_qr_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountQrToken _$AccountQrTokenFromJson(Map<String, dynamic> json) =>
    AccountQrToken(
      requestKey: json['RequestKey'] as String?,
      status: $enumDecodeNullable(_$StatusEnumMap, json['Status']),
      accountToken: json['AccountToken'] as String?,
      bankMemberId: json['BankMemberId'] as String?,
      bankMemberName: json['BankMemberName'] as String?,
    );

Map<String, dynamic> _$AccountQrTokenToJson(AccountQrToken instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RequestKey', instance.requestKey);
  writeNotNull('Status', _$StatusEnumMap[instance.status]);
  writeNotNull('AccountToken', instance.accountToken);
  writeNotNull('BankMemberId', instance.bankMemberId);
  writeNotNull('BankMemberName', instance.bankMemberName);
  return val;
}

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
