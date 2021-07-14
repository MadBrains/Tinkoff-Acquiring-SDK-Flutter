// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_3ds_version_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Check3DSVersionRequest _$Check3DSVersionRequestFromJson(
        Map<String, dynamic> json) =>
    Check3DSVersionRequest(
      paymentId: json['PaymentId'] as int,
      cardData: json['CardData'] as String,
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$Check3DSVersionRequestToJson(
    Check3DSVersionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  val['PaymentId'] = instance.paymentId;
  val['CardData'] = instance.cardData;
  return val;
}
