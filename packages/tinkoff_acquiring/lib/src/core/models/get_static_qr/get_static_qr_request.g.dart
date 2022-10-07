// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_static_qr_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStaticQrRequest _$GetStaticQrRequestFromJson(Map<String, dynamic> json) =>
    GetStaticQrRequest(
      dataType: $enumDecodeNullable(_$DataTypeEnumMap, json['DataType'],
          unknownValue: DataType.payload),
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$GetStaticQrRequestToJson(GetStaticQrRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  writeNotNull('DataType', _$DataTypeEnumMap[instance.dataType]);
  return val;
}

const _$DataTypeEnumMap = {
  DataType.notExist: 'notExist',
  DataType.payload: 'PAYLOAD',
  DataType.image: 'IMAGE',
};
