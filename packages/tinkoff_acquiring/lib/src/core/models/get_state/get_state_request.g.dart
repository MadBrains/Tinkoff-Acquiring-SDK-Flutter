// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_state_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStateRequest _$GetStateRequestFromJson(Map<String, dynamic> json) =>
    GetStateRequest(
      paymentId: json['PaymentId'] as int,
      ip: json['IP'] as String?,
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$GetStateRequestToJson(GetStateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  val['PaymentId'] = instance.paymentId;
  writeNotNull('IP', instance.ip);
  return val;
}
