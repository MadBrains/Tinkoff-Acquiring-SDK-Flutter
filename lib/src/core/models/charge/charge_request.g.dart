// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charge_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChargeRequest _$ChargeRequestFromJson(Map<String, dynamic> json) {
  return ChargeRequest(
    json['PaymentId'] as int,
    json['RebillId'] as int,
    sendEmail: json['SendEmail'] as bool,
    infoEmail: json['InfoEmail'] as String,
    ip: json['IP'] as String,
    signToken: json['Token'] as String,
  );
}

Map<String, dynamic> _$ChargeRequestToJson(ChargeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  writeNotNull('PaymentId', instance.paymentId);
  writeNotNull('RebillId', instance.rebillId);
  writeNotNull('SendEmail', instance.sendEmail);
  writeNotNull('InfoEmail', instance.infoEmail);
  writeNotNull('IP', instance.ip);
  return val;
}
