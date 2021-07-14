// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_card_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoveCardResponse _$RemoveCardResponseFromJson(Map<String, dynamic> json) =>
    RemoveCardResponse(
      success: json['Success'] as bool?,
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
      details: json['Details'] as String?,
      terminalKey: json['TerminalKey'] as String?,
      customerKey: json['CustomerKey'] as String?,
      cardId: json['CardId'] as String?,
      cardStatus: _$enumDecodeNullable(_$CardStatusEnumMap, json['Status'],
          unknownValue: CardStatus.notExist),
    );

Map<String, dynamic> _$RemoveCardResponseToJson(RemoveCardResponse instance) =>
    <String, dynamic>{
      'Success': instance.success,
      'ErrorCode': instance.errorCode,
      'Message': instance.message,
      'Details': instance.details,
      'TerminalKey': instance.terminalKey,
      'CustomerKey': instance.customerKey,
      'CardId': instance.cardId,
      'Status': _$CardStatusEnumMap[instance.cardStatus],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$CardStatusEnumMap = {
  CardStatus.active: 'A',
  CardStatus.inactive: 'I',
  CardStatus.deleted: 'D',
  CardStatus.notExist: 'notExist',
};
