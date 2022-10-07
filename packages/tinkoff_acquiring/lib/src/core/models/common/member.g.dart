// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      memberId: json['MemberId'] as String?,
      memberName: json['MemberName'] as String?,
      isPayee: json['IsPayee'] as bool?,
    );

Map<String, dynamic> _$MemberToJson(Member instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MemberId', instance.memberId);
  writeNotNull('MemberName', instance.memberName);
  writeNotNull('IsPayee', instance.isPayee);
  return val;
}
