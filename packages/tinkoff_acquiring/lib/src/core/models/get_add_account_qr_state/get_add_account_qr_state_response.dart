import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_response.dart';
import '../enums/status.dart';

part 'get_add_account_qr_state_response.g.dart';

/// Ответ от сервера на статус привязки счета Покупателя по магазину в СБП
///
/// [GetAddAccountQrStateResponse](https://www.tinkoff.ru/kassa/develop/api/payments-sbp/getaddaccountqrstate-response/)
@JsonSerializable()
class GetAddAccountQrStateResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на статус привязки счета Покупателя по магазину в СБП
  GetAddAccountQrStateResponse({
    Status? status,
    bool? success,
    String? errorCode,
    String? message,
    String? details,
    this.terminalKey,
    this.requestKey,
    this.bankMemberId,
    this.bankMemberName,
  }) : super(
          status: status,
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory GetAddAccountQrStateResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAddAccountQrStateResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetAddAccountQrStateResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.terminalKey: terminalKey,
        JsonKeys.requestKey: requestKey,
        JsonKeys.bankMemberId: bankMemberId,
        JsonKeys.bankMemberName: bankMemberName,
      };

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  @JsonKey(name: JsonKeys.terminalKey)
  final String? terminalKey;

  /// Идентификатор запроса на привязку счета
  @JsonKey(name: JsonKeys.requestKey)
  final String? requestKey;

  /// Идентификатор Банка Плательщика, который будет совершать оплату по привязаному счету - заполнен,
  /// если статус ACTIVE, INACTIVE
  @JsonKey(name: JsonKeys.bankMemberId)
  final String? bankMemberId;

  /// Наименование Банка, заполнен если BankMemberId передан
  @JsonKey(name: JsonKeys.bankMemberName)
  final String? bankMemberName;
}
