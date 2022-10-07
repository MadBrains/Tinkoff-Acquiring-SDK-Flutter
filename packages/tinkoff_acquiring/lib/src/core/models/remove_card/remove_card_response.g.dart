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
      cardStatus: $enumDecodeNullable(_$CardStatusEnumMap, json['Status'],
          unknownValue: CardStatus.notExist),
      cardType: $enumDecodeNullable(_$CardTypeEnumMap, json['CardType'],
          unknownValue: CardType.notExist),
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
      'CardType': _$CardTypeEnumMap[instance.cardType],
    };

const _$CardStatusEnumMap = {
  CardStatus.active: 'A',
  CardStatus.inactive: 'I',
  CardStatus.deleted: 'D',
  CardStatus.notExist: 'notExist',
};

const _$CardTypeEnumMap = {
  CardType.notExist: 'notExist',
  CardType.writeOffs: 0,
  CardType.replenishment: 1,
  CardType.writeOffsAndReplenishment: 2,
};
