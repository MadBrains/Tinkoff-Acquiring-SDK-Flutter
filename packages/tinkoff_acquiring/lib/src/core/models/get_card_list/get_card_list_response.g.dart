// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_card_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCardListResponse _$GetCardListResponseFromJson(Map<String, dynamic> json) =>
    GetCardListResponse(
      success: json['Success'] as bool?,
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
      details: json['Details'] as String?,
      cardInfo: (json['CardInfo'] as List<dynamic>?)
          ?.map((e) => CardInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCardListResponseToJson(
        GetCardListResponse instance) =>
    <String, dynamic>{
      'Success': instance.success,
      'ErrorCode': instance.errorCode,
      'Message': instance.message,
      'Details': instance.details,
      'CardInfo': instance.cardInfo,
    };
