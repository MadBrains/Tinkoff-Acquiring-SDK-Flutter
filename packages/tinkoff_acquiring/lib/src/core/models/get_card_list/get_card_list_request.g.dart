// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_card_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCardListRequest _$GetCardListRequestFromJson(Map<String, dynamic> json) =>
    GetCardListRequest(
      customerKey: json['CustomerKey'] as String,
      ip: json['IP'] as String?,
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$GetCardListRequestToJson(GetCardListRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  val['CustomerKey'] = instance.customerKey;
  writeNotNull('IP', instance.ip);
  return val;
}
