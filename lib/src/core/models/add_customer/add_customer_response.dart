import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_response.dart';

part 'add_customer_response.g.dart';

/// Ответ от сервера на регистрацию покупателя
///
/// [AddCustomerResponse](https://oplata.tinkoff.ru/develop/api/autopayments/addcustomer-response/)
@JsonSerializable()
class AddCustomerResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на регистрацию покупателя
  AddCustomerResponse({
    bool? success,
    String? errorCode,
    String? message,
    String? details,
    this.terminalKey,
    this.customerKey,
  }) : super(
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory AddCustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$AddCustomerResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AddCustomerResponseToJson(this);

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
