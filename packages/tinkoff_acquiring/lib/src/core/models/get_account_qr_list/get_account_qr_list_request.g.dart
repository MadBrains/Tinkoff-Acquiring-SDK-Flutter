// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_account_qr_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAccountQrListRequest _$GetAccountQrListRequestFromJson(
        Map<String, dynamic> json) =>
    GetAccountQrListRequest(
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$GetAccountQrListRequestToJson(
    GetAccountQrListRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  return val;
}
