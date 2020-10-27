import 'package:json_annotation/json_annotation.dart';

import '../../constants.dart';
import '../base/acquiring_response.dart';

part 'add_card_response.g.dart';

/// Ответ от сервера на привязку карты к покупателю
///
/// [AddCardResponse](http://static2.tinkoff.ru/acquiring/manuals/android_sdk.pdf)
@JsonSerializable()
class AddCardResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на привязку карты к покупателю
  AddCardResponse({
    bool success,
    String errorCode,
    String message,
    String details,
    this.terminalKey,
    this.customerKey,
    this.requestKey,
    this.paymentURL,
  }) : super(
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory AddCardResponse.fromJson(Map<String, dynamic> json) =>
      _$AddCardResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AddCardResponseToJson(this);

  @override
  String toString() {
    return 'AddCardResponse(terminalKey: $terminalKey, customerKey: $customerKey, requestKey: $requestKey, success: $success, paymentURL: $paymentURL, errorCode: $errorCode, message: $message, details: $details)';
  }

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  @JsonKey(name: JsonKeys.terminalKey)
  final String terminalKey;

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.customerKey)
  final String customerKey;

  /// Идентификатор запроса на привязку карты
  @JsonKey(name: JsonKeys.requestKey)
  final String requestKey;

  /// Ссылка на страницу привязки карты.
  /// На данную страницу необходимо переадресовать клиента для привязки карты
  @JsonKey(name: JsonKeys.paymentUrl)
  final String paymentURL;
}
