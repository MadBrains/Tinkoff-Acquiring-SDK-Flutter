// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmRequest _$ConfirmRequestFromJson(Map<String, dynamic> json) =>
    ConfirmRequest(
      paymentId: json['PaymentId'] as int,
      amount: json['Amount'] as int?,
      ip: json['IP'] as String?,
      receipt: json['Receipt'] == null
          ? null
          : Receipt.fromJson(json['Receipt'] as Map<String, dynamic>),
      shops: (json['Shops'] as List<dynamic>?)
          ?.map((e) => Shops.fromJson(e as Map<String, dynamic>))
          .toList(),
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$ConfirmRequestToJson(ConfirmRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  val['PaymentId'] = instance.paymentId;
  writeNotNull('Amount', instance.amount);
  writeNotNull('IP', instance.ip);
  writeNotNull('Receipt', instance.receipt);
  writeNotNull('Shops', instance.shops);
  return val;
}
