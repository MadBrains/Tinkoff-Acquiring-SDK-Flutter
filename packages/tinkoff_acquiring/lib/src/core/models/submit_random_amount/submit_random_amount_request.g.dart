// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_random_amount_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitRandomAmountRequest _$SubmitRandomAmountRequestFromJson(
        Map<String, dynamic> json) =>
    SubmitRandomAmountRequest(
      requestKey: json['RequestKey'] as String,
      amount: json['Amount'] as int,
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$SubmitRandomAmountRequestToJson(
    SubmitRandomAmountRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  val['RequestKey'] = instance.requestKey;
  val['Amount'] = instance.amount;
  return val;
}
