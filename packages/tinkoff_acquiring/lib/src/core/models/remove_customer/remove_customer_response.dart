import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_response.dart';
import '../enums/status.dart';

part 'remove_customer_response.g.dart';

/// Ответ от сервера на удаление данных покупателя
///
/// [RemoveCustomerResponse](https://www.tinkoff.ru/kassa/develop/api/autopayments/removecustomer-response/)
@JsonSerializable()
class RemoveCustomerResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на удаление данных покупателя
  RemoveCustomerResponse({
    Status? status,
    bool? success,
    String? errorCode,
    String? message,
    String? details,
    this.terminalKey,
    this.customerKey,
  }) : super(
          status: status,
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory RemoveCustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoveCustomerResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RemoveCustomerResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.terminalKey: terminalKey,
        JsonKeys.customerKey: customerKey,
      };

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  @JsonKey(name: JsonKeys.terminalKey)
  final String? terminalKey;

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.customerKey)
  final String? customerKey;
}
