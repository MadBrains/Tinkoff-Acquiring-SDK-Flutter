import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_response.dart';
import '../enums/status.dart';

part 'add_card_response.g.dart';

/// Ответ от сервера на привязку карты к покупателю
///
/// [AddCardResponse](http://static2.tinkoff.ru/acquiring/manuals/android_sdk.pdf)
@JsonSerializable()
class AddCardResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на привязку карты к покупателю
  AddCardResponse({
    Status? status,
    bool? success,
    String? errorCode,
    String? message,
    String? details,
    this.terminalKey,
    this.customerKey,
    this.requestKey,
    this.paymentURL,
    this.paymentId,
  }) : super(
          status: status,
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
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.terminalKey: terminalKey,
        JsonKeys.customerKey: customerKey,
        JsonKeys.requestKey: requestKey,
        JsonKeys.paymentUrl: paymentURL,
      };

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  @JsonKey(name: JsonKeys.terminalKey)
  final String? terminalKey;

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.customerKey)
  final String? customerKey;

  /// Идентификатор запроса на привязку карты
  @JsonKey(name: JsonKeys.requestKey)
  final String? requestKey;

  /// Ссылка на страницу привязки карты.
  /// На данную страницу необходимо переадресовать клиента для привязки карты
  @JsonKey(name: JsonKeys.paymentUrl)
  final String? paymentURL;

  /// Уникальный идентификатор транзакции в системе Банка
  @JsonKey(name: JsonKeys.paymentId)
  final int? paymentId;
}
