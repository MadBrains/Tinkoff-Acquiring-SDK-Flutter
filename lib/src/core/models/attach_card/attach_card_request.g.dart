// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attach_card_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachCardRequest _$AttachCardRequestFromJson(Map<String, dynamic> json) {
  return AttachCardRequest(
    json['RequestKey'] as String,
    json['CardData'] as String,
    data: (json['DATA'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    signToken: json['Token'] as String,
  );
}

Map<String, dynamic> _$AttachCardRequestToJson(AttachCardRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  writeNotNull('RequestKey', instance.requestKey);
  writeNotNull('CardData', instance.cardData);
  writeNotNull('DATA', instance.data);
  return val;
}
