// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelRequest _$CancelRequestFromJson(Map<String, dynamic> json) =>
    CancelRequest(
      paymentId: json['PaymentId'] as int,
      ip: json['IP'] as String?,
      amount: json['Amount'] as int?,
      receipt: json['Receipt'] == null
          ? null
          : Receipt.fromJson(json['Receipt'] as Map<String, dynamic>),
      shops: (json['Shops'] as List<dynamic>?)
          ?.map((e) => Shops.fromJson(e as Map<String, dynamic>))
          .toList(),
      qrMemberId: json['QrMemberId'] as String?,
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$CancelRequestToJson(CancelRequest instance) {
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
  writeNotNull('QrMemberId', instance.qrMemberId);
  return val;
}
