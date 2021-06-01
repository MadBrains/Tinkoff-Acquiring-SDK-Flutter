import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_response.dart';

part 'get_qr_response.g.dart';

/// Ответ от сервера на регистрацию QR
///
/// [GetQrResponse](https://oplata.tinkoff.ru/develop/api/autopayments/getqr-response/)
@JsonSerializable()
class GetQrResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на регистрацию QR
  GetQrResponse({
    bool? success,
    String? errorCode,
    String? message,
    String? details,
    this.terminalKey,
    this.paymentId,
    this.orderId,
    this.data,
  }) : super(
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory GetQrResponse.fromJson(Map<String, dynamic> json) =>
      _$GetQrResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetQrResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.terminalKey: terminalKey,
        JsonKeys.paymentId: paymentId,
        JsonKeys.orderId: orderId,
        JsonKeys.data2: data,
      };

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  @JsonKey(name: JsonKeys.terminalKey)
  final String? terminalKey;

  /// Уникальный идентификатор транзакции в системе Банка, полученный в ответе на вызов метода `Init`
  @JsonKey(name: JsonKeys.paymentId)
  final int? paymentId;

  /// Идентификатор заказа в системе продавца
  @JsonKey(name: JsonKeys.orderId)
  final String? orderId;

  /// В зависимости от `DataType` в запросе это: `Payload` - информация,
  /// которая должна быть закодирована в `QR`
  /// или `SVG` изображение `QR` в котором уже закодирован `Payload`
  @JsonKey(name: JsonKeys.data2)
  final String? data;
}
