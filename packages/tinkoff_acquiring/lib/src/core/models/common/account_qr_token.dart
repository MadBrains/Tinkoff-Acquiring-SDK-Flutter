import 'package:json_annotation/json_annotation.dart';

import '../base/base_request.dart';
import '../enums/status.dart';

part 'account_qr_token.g.dart';

///
@JsonSerializable(includeIfNull: false)
class AccountQrToken extends BaseRequest {
  ///
  AccountQrToken({
    this.requestKey,
    this.status,
    this.accountToken,
    this.bankMemberId,
    this.bankMemberName,
  });

  /// Преобразование json в модель
  factory AccountQrToken.fromJson(Map<String, dynamic> json) =>
      _$AccountQrTokenFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.requestKey: requestKey,
        JsonKeys.status: status,
        JsonKeys.accountToken: accountToken,
        JsonKeys.bankMemberId: bankMemberId,
        JsonKeys.bankMemberName: bankMemberName,
      };

  @override
  Map<String, dynamic> toJson() => _$AccountQrTokenToJson(this);

  @override
  AccountQrToken copyWith({
    String? requestKey,
    Status? status,
    String? accountToken,
    String? bankMemberId,
    String? bankMemberName,
  }) {
    return AccountQrToken(
      requestKey: requestKey ?? this.requestKey,
      status: status ?? this.status,
      accountToken: accountToken ?? this.accountToken,
      bankMemberId: bankMemberId ?? this.bankMemberId,
      bankMemberName: bankMemberName ?? this.bankMemberName,
    );
  }

  @override
  void validate() {}

  /// Идентификатор запроса на привязку счета
  @JsonKey(name: JsonKeys.requestKey)
  final String? requestKey;

  /// Статус привязки
  @JsonKey(name: JsonKeys.status)
  final Status? status;

  /// Идентификатор привязки счета, назначаемый Банком Плательщика
  @JsonKey(name: JsonKeys.accountToken)
  final String? accountToken;

  /// Идентификатор Банка Плательщика, который будет совершать оплату по привязаному счету - заполнен,
  /// если статус ACTIVE, INACTIVE
  @JsonKey(name: JsonKeys.bankMemberId)
  final String? bankMemberId;

  /// Наименование Банка, заполнен если BankMemberId передан
  @JsonKey(name: JsonKeys.bankMemberName)
  final String? bankMemberName;
}
