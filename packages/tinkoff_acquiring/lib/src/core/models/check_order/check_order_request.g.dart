// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckOrderRequest _$CheckOrderRequestFromJson(Map<String, dynamic> json) =>
    CheckOrderRequest(
      orderId: json['OrderId'] as int,
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$CheckOrderRequestToJson(CheckOrderRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  val['OrderId'] = instance.orderId;
  return val;
}
