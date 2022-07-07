// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_account_qr_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAccountQrRequest _$AddAccountQrRequestFromJson(Map<String, dynamic> json) =>
    AddAccountQrRequest(
      description: json['Description'] as String,
      dataType: $enumDecodeNullable(_$DataTypeEnumMap, json['DataType'],
          unknownValue: DataType.payload),
      data: (json['DATA'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      redirectDueDate: json['RedirectDueDate'] as String?,
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$AddAccountQrRequestToJson(AddAccountQrRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  val['Description'] = instance.description;
  writeNotNull('DataType', _$DataTypeEnumMap[instance.dataType]);
  writeNotNull('DATA', instance.data);
  writeNotNull('RedirectDueDate', instance.redirectDueDate);
  return val;
}

const _$DataTypeEnumMap = {
  DataType.notExist: 'notExist',
  DataType.payload: 'PAYLOAD',
  DataType.image: 'IMAGE',
};
