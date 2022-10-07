// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientInfo _$ClientInfoFromJson(Map<String, dynamic> json) => ClientInfo(
      birthdate: json['Birthdate'] as String?,
      citizenship: json['citizenship'] as String?,
      documentCode: json['DocumentСode'] as String?,
      documentData: json['DocumentData'] as String?,
      address: json['Address'] as String?,
    );

Map<String, dynamic> _$ClientInfoToJson(ClientInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Birthdate', instance.birthdate);
  writeNotNull('citizenship', instance.citizenship);
  writeNotNull('DocumentСode', instance.documentCode);
  writeNotNull('DocumentData', instance.documentData);
  writeNotNull('Address', instance.address);
  return val;
}
