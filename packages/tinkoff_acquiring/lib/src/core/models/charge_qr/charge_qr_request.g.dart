// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charge_qr_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChargeQrRequest _$ChargeQrRequestFromJson(Map<String, dynamic> json) =>
    ChargeQrRequest(
      paymentId: json['PaymentId'] as int,
      accountToken: json['AccountToken'] as String,
      ip: json['IP'] as String?,
      sendEmail: json['SendEmail'] as bool?,
      infoEmail: json['InfoEmail'] as String?,
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$ChargeQrRequestToJson(ChargeQrRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  val['PaymentId'] = instance.paymentId;
  val['AccountToken'] = instance.accountToken;
  writeNotNull('IP', instance.ip);
  writeNotNull('SendEmail', instance.sendEmail);
  writeNotNull('InfoEmail', instance.infoEmail);
  return val;
}
