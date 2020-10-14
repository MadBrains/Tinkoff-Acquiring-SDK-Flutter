import 'package:json_annotation/json_annotation.dart';

import '../../constants.dart';
import '../base/acquiring_request.dart';

part 'remove_customer_request.g.dart';

/// Метод удаляет данные зарегистрированного покупателя.
///
/// [RemoveCustomerRequest](https://oplata.tinkoff.ru/develop/api/autopayments/removecustomer-request/)
@JsonSerializable(includeIfNull: false)
class RemoveCustomerRequest extends AcquiringRequest {
  /// Создает экземпляр метода по удалению данных покупателя
  RemoveCustomerRequest(
    this.customerKey, {
    this.ip,
    String signToken,
  }) : super(signToken) {
    validate();
  }

  /// Преобразование json в модель
  factory RemoveCustomerRequest.fromJson(Map<String, dynamic> json) =>
      _$RemoveCustomerRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.removeCustomer;

  @override
  Map<String, dynamic> toJson() => _$RemoveCustomerRequestToJson(this);

  @override
  RemoveCustomerRequest copyWith({
    String customerKey,
    String ip,
    String signToken,
  }) {
    return RemoveCustomerRequest(
      customerKey ?? this.customerKey,
      ip: ip ?? this.ip,
      signToken: signToken ?? this.signToken,
    );
  }

  @override
  void validate() {
    assert(customerKey.length <= 36);

    if (ip != null) {
      assert(ip.length >= 7 && ip.length <= 45);
    }
  }

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.customerKey)
  final String customerKey;

  /// IP-адрес покупателя
  @JsonKey(name: JsonKeys.ip)
  final String ip;
}
