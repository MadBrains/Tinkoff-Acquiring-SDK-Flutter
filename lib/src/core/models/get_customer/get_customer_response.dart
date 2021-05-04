import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_response.dart';

part 'get_customer_response.g.dart';

/// Ответ от сервера на получению данных покупателя
///
/// [GetCustomerResponse](https://oplata.tinkoff.ru/develop/api/autopayments/getcustomer-response/)
@JsonSerializable()
class GetCustomerResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на получению данных покупателя
  GetCustomerResponse({
    bool? success,
    String? errorCode,
    String? message,
    String? details,
    this.terminalKey,
    this.customerKey,
    this.email,
    this.phone,
  }) : super(
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory GetCustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCustomerResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetCustomerResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.terminalKey: terminalKey,
        JsonKeys.customerKey: customerKey,
        JsonKeys.email: email,
        JsonKeys.phone: phone,
      };

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  @JsonKey(name: JsonKeys.terminalKey)
  final String? terminalKey;

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.customerKey)
  final String? customerKey;

  /// Электронная почта покупателя
  ///
  /// Пример: `a@test.ru`
  @JsonKey(name: JsonKeys.email)
  final String? email;

  /// Телефон покупателя
  ///
  /// Строка длиной от 1 до 19 символов, формат +{Ц}
  ///
  /// Пример: `+71234567890`
  @JsonKey(name: JsonKeys.phone)
  final String? phone;
}
