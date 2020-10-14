// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardInfo _$CardInfoFromJson(Map<String, dynamic> json) {
  return CardInfo(
    pan: json['PAN'] as String,
    cardId: json['CardId'] as String,
    rebillId: json['RebillId'] as String,
    cardType: _$enumDecodeNullable(_$CardTypeEnumMap, json['CardType']),
    expDate: json['ExpDate'] as String,
    status: _$enumDecodeNullable(_$CardStatusEnumMap, json['Status']),
  );
}

Map<String, dynamic> _$CardInfoToJson(CardInfo instance) => <String, dynamic>{
      'PAN': instance.pan,
      'CardId': instance.cardId,
      'RebillId': instance.rebillId,
      'CardType': _$CardTypeEnumMap[instance.cardType],
      'Status': _$CardStatusEnumMap[instance.status],
      'ExpDate': instance.expDate,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
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
