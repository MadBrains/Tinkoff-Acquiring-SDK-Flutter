// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardInfo _$CardInfoFromJson(Map<String, dynamic> json) => CardInfo(
      pan: json['Pan'] as String?,
      cardId: json['CardId'] as String?,
      rebillId: json['RebillId'] as String?,
      cardType: $enumDecodeNullable(_$CardTypeEnumMap, json['CardType'],
          unknownValue: CardType.notExist),
      expDate: json['ExpDate'] as String?,
      status: $enumDecodeNullable(_$CardStatusEnumMap, json['Status']),
    );

Map<String, dynamic> _$CardInfoToJson(CardInfo instance) => <String, dynamic>{
      'Pan': instance.pan,
      'CardId': instance.cardId,
      'RebillId': instance.rebillId,
      'CardType': _$CardTypeEnumMap[instance.cardType],
      'Status': _$CardStatusEnumMap[instance.status],
      'ExpDate': instance.expDate,
    };

const _$CardTypeEnumMap = {
  CardType.notExist: 'notExist',
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
