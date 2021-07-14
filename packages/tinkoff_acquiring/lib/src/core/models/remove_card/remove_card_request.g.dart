// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_card_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoveCardRequest _$RemoveCardRequestFromJson(Map<String, dynamic> json) =>
    RemoveCardRequest(
      cardId: json['CardId'] as int,
      customerKey: json['CustomerKey'] as String,
      ip: json['IP'] as String?,
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$RemoveCardRequestToJson(RemoveCardRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  val['CardId'] = instance.cardId;
  val['CustomerKey'] = instance.customerKey;
  writeNotNull('IP', instance.ip);
  return val;
}
