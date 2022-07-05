// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_add_card_state_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAddCardStateRequest _$GetAddCardStateRequestFromJson(
        Map<String, dynamic> json) =>
    GetAddCardStateRequest(
      requestKey: json['RequestKey'] as String,
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$GetAddCardStateRequestToJson(
    GetAddCardStateRequest instance) {
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
