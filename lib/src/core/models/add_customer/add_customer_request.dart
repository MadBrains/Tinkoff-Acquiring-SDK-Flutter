import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';

part 'add_customer_request.g.dart';

/// Метод регистрирует покупателя и его данные в системе продавца.
///
/// [AddCustomerRequest](https://oplata.tinkoff.ru/develop/api/autopayments/addcustomer-request/)
@JsonSerializable(includeIfNull: false)
class AddCustomerRequest extends AcquiringRequest {
  /// Создает экземпляр метода регистрации покупателя
  AddCustomerRequest({
    required this.customerKey,
    this.email,
    this.phone,
    this.ip,
    String? signToken,
  }) : super(signToken) {
    validate();
  }

  /// Преобразование json в модель
  factory AddCustomerRequest.fromJson(Map<String, dynamic> json) =>
      _$AddCustomerRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.addCustomer;

  @override
  Map<String, dynamic> toJson() => _$AddCustomerRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.customerKey: customerKey,
        JsonKeys.email: email,
        JsonKeys.phone: phone,
        JsonKeys.ip: ip,
      };

  @override
  AddCustomerRequest copyWith({
    String? customerKey,
    String? email,
    String? phone,
    String? ip,
    String? signToken,
  }) {
    return AddCustomerRequest(
      customerKey: customerKey ?? this.customerKey,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      ip: ip ?? this.ip,
      signToken: signToken ?? this.signToken,
    );
  }

  @override
  void validate() {
    assert(customerKey.length <= 36);

    final String? _ip = ip;
    if (_ip != null) {
      assert(_ip.length >= 7 && _ip.length <= 45);
    }

    final String? _email = email;
    if (_email != null) {
      final bool match =
          RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')
              .hasMatch(_email);
      assert(_email.length <= 100 && match);
    }

    final String? _phone = phone;
    if (_phone != null) {
      final bool match = RegExp(r'^\+[0-9](?:[\d]*)$').hasMatch(_phone);
      assert(_phone.length <= 19 && match);
    }
  }

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.customerKey)
  final String customerKey;

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

  /// IP-адрес покупателя
  @JsonKey(name: JsonKeys.ip)
  final String? ip;
}
