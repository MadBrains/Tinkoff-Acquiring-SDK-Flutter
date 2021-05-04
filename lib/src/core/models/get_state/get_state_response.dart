import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_response.dart';
import '../enums/status.dart';

part 'get_state_response.g.dart';

/// Ответ от сервера на получение статуса платежа
///
/// [GetStateResponse](https://oplata.tinkoff.ru/develop/api/payments/getstate-response/)
@JsonSerializable()
class GetStateResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на получение статуса платежа
  GetStateResponse({
    Status? status,
    bool? success,
    String? errorCode,
    String? message,
    String? details,
    this.terminalKey,
    this.orderId,
    this.paymentId,
  }) : super(
          status: status,
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory GetStateResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStateResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetStateResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.terminalKey: terminalKey,
        JsonKeys.orderId: orderId,
        JsonKeys.paymentId: paymentId,
      };

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  @JsonKey(name: JsonKeys.terminalKey)
  final String? terminalKey;

  /// Идентификатор заказа в системе продавца
  @JsonKey(name: JsonKeys.orderId)
  final String? orderId;

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.paymentId)
  final String? paymentId;
}
