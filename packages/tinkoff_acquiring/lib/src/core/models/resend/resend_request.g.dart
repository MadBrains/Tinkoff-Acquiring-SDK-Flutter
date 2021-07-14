// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResendRequest _$ResendRequestFromJson(Map<String, dynamic> json) =>
    ResendRequest(
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$ResendRequestToJson(ResendRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  return val;
}
