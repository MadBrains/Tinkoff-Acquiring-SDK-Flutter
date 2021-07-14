// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardInfo _$CardInfoFromJson(Map<String, dynamic> json) => CardInfo(
      pan: json['Pan'] as String?,
      cardId: json['CardId'] as String?,
      rebillId: json['RebillId'] as String?,
      cardType: _$enumDecodeNullable(_$CardTypeEnumMap, json['CardType']),
      expDate: json['ExpDate'] as String?,
      status: _$enumDecodeNullable(_$CardStatusEnumMap, json['Status']),
    );

Map<String, dynamic> _$CardInfoToJson(CardInfo instance) => <String, dynamic>{
      'Pan': instance.pan,
      'CardId': instance.cardId,
      'RebillId': instance.rebillId,
      'CardType': _$CardTypeEnumMap[instance.cardType],
      'Status': _$CardStatusEnumMap[instance.status],
      'ExpDate': instance.expDate,
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

const _$CardTypeEnumMap = {
  CardType.writeOffs: 0,
  CardType.replenishment: 1,
  CardType.writeOffsAndReplenishment: 2,
};

const _$CardStatusEnumMap = {
  CardStatus.active: 'A',
  CardStatus.inactive: 'I',
  CardStatus.deleted: 'D',
  CardStatus.notExist: 'notExist',
};
