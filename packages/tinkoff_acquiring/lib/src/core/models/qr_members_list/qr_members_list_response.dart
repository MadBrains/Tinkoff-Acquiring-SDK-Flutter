import 'package:json_annotation/json_annotation.dart';

import '../models.dart';

part 'qr_members_list_response.g.dart';

/// Ответ от сервера на получение cписока участников куда может быть осуществлен возврат платежа, совершенного по QR.
///
/// [QrMembersListResponse](https://www.tinkoff.ru/kassa/develop/api/payments/QrMembersList-response/)
@JsonSerializable()
class QrMembersListResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на получение cписока участников куда может быть осуществлен возврат платежа, совершенного по QR.
  QrMembersListResponse({
    Status? status,
    bool? success,
    String? errorCode,
    String? message,
    String? details,
    this.members,
    this.orderId,
  }) : super(
          status: status,
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory QrMembersListResponse.fromJson(Map<String, dynamic> json) =>
      _$QrMembersListResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$QrMembersListResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.terminalKey: members,
        JsonKeys.orderId: orderId,
      };

  /// Идентификатор заказа в системе продавца
  @JsonKey(name: JsonKeys.orderId)
  final String? orderId;

  /// Массив списка участников. Возвращается только если возврат возможен
  @JsonKey(name: JsonKeys.members)
  final List<Member>? members;
}
