// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_add_account_qr_state_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAddAccountQrStateRequest _$GetAddAccountQrStateRequestFromJson(
        Map<String, dynamic> json) =>
    GetAddAccountQrStateRequest(
      requestKey: json['RequestKey'] as String,
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$GetAddAccountQrStateRequestToJson(
    GetAddAccountQrStateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  val['RequestKey'] = instance.requestKey;
  return val;
}
