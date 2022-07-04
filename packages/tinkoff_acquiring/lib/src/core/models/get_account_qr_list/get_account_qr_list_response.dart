import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_response.dart';
import '../common/account_qr_token.dart';
import '../enums/status.dart';

part 'get_account_qr_list_response.g.dart';

/// Ответ от сервера на список привязанных счетов покупателя по магазину
///
/// [GetAccountQrListResponse](https://www.tinkoff.ru/kassa/develop/api/payments-sbp/getaccountqrlist-response/)
@JsonSerializable()
class GetAccountQrListResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на список привязанных счетов покупателя по магазину
  GetAccountQrListResponse({
    Status? status,
    bool? success,
    String? errorCode,
    String? message,
    String? details,
    this.accountTokens,
  }) : super(
          status: status,
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory GetAccountQrListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAccountQrListResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetAccountQrListResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.accountTokens: accountTokens,
      };

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  @JsonKey(name: JsonKeys.accountTokens)
  final List<AccountQrToken>? accountTokens;
}
