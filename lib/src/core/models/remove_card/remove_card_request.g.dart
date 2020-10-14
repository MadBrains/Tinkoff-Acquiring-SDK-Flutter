// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_card_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoveCardRequest _$RemoveCardRequestFromJson(Map<String, dynamic> json) {
  return RemoveCardRequest(
    json['CardId'] as int,
    json['CustomerKey'] as String,
    ip: json['IP'] as String,
    signToken: json['Token'] as String,
  );
}

Map<String, dynamic> _$RemoveCardRequestToJson(RemoveCardRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  writeNotNull('CardId', instance.cardId);
  writeNotNull('CustomerKey', instance.customerKey);
  writeNotNull('IP', instance.ip);
  return val;
}
