// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sbp_pay_test_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SbpPayTestRequest _$SbpPayTestRequestFromJson(Map<String, dynamic> json) =>
    SbpPayTestRequest(
      paymentId: json['PaymentId'] as String,
      isDeadlineExpired: json['IsDeadlineExpired'] as bool?,
      isRejected: json['IsRejected'] as bool?,
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$SbpPayTestRequestToJson(SbpPayTestRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  val['PaymentId'] = instance.paymentId;
  writeNotNull('IsDeadlineExpired', instance.isDeadlineExpired);
  writeNotNull('IsRejected', instance.isRejected);
  return val;
}
