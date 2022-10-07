// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_members_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrMembersListRequest _$QrMembersListRequestFromJson(
        Map<String, dynamic> json) =>
    QrMembersListRequest(
      paymentId: json['PaymentId'] as int,
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$QrMembersListRequestToJson(
    QrMembersListRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  val['PaymentId'] = instance.paymentId;
  return val;
}
