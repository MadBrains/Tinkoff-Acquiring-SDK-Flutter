// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_card_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCardRequest _$AddCardRequestFromJson(Map<String, dynamic> json) =>
    AddCardRequest(
      customerKey: json['CustomerKey'] as String,
      checkType: $enumDecodeNullable(_$CheckTypeEnumMap, json['CheckType']),
      ip: json['IP'] as String?,
      residentState: json['ResidentState'] as bool?,
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$AddCardRequestToJson(AddCardRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  val['CustomerKey'] = instance.customerKey;
  writeNotNull('CheckType', _$CheckTypeEnumMap[instance.checkType]);
  writeNotNull('IP', instance.ip);
  writeNotNull('ResidentState', instance.residentState);
  return val;
}

const _$CheckTypeEnumMap = {
  CheckType.no: 'NO',
  CheckType.hold: 'HOLD',
  CheckType.threeDS: '3DS',
  CheckType.threeDSHold: '3DSHOLD',
};
