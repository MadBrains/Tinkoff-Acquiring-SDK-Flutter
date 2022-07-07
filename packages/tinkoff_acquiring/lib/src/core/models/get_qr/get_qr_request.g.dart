// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_qr_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetQrRequest _$GetQrRequestFromJson(Map<String, dynamic> json) => GetQrRequest(
      paymentId: json['PaymentId'] as int,
      dataType: $enumDecodeNullable(_$DataTypeEnumMap, json['DataType'],
          unknownValue: DataType.payload),
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$GetQrRequestToJson(GetQrRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  val['PaymentId'] = instance.paymentId;
  writeNotNull('DataType', _$DataTypeEnumMap[instance.dataType]);
  return val;
}

const _$DataTypeEnumMap = {
  DataType.notExist: 'notExist',
  DataType.payload: 'PAYLOAD',
  DataType.image: 'IMAGE',
};
