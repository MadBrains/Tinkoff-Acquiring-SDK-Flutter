// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_closing_receipt_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendClosingReceiptRequest _$SendClosingReceiptRequestFromJson(
        Map<String, dynamic> json) =>
    SendClosingReceiptRequest(
      paymentId: json['PaymentId'] as int,
      receipt: Receipt.fromJson(json['Receipt'] as Map<String, dynamic>),
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$SendClosingReceiptRequestToJson(
    SendClosingReceiptRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  val['PaymentId'] = instance.paymentId;
  val['Receipt'] = instance.receipt;
  return val;
}
