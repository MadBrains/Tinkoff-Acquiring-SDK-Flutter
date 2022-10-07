import 'package:json_annotation/json_annotation.dart';

import '../base/base_request.dart';

part 'member.g.dart';

/// Данные участника
///
/// [Member](https://www.tinkoff.ru/kassa/develop/api/receipt/ffd12/#Member)
@JsonSerializable(includeIfNull: false)
class Member extends BaseRequest {
  /// Создает экземпляр rод маркировки в машиночитаемой форме
  Member({
    this.memberId,
    this.memberName,
    this.isPayee,
  });

  /// Преобразование json в модель
  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.memberId: memberId,
        JsonKeys.memberName: memberName,
        JsonKeys.isPayee: isPayee,
      };

  @override
  Map<String, dynamic> toJson() => _$MemberToJson(this);

  @override
  Member copyWith({
    String? memberId,
    String? memberName,
    bool? isPayee,
  }) {
    return Member(
      memberId: memberId ?? this.memberId,
      memberName: memberName ?? this.memberName,
      isPayee: isPayee ?? this.isPayee,
    );
  }

  @override
  void validate() {}

  /// Идентификатор участника
  @JsonKey(name: JsonKeys.memberId)
  final String? memberId;

  /// Наименование участника
  @JsonKey(name: JsonKeys.memberName)
  final String? memberName;

  /// true - если данный участник был получателем указанного платежа,
  /// false - в противном случае
  @JsonKey(name: JsonKeys.isPayee)
  final bool? isPayee;
}
