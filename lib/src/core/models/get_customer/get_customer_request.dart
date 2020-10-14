import 'package:json_annotation/json_annotation.dart';

import '../../constants.dart';
import '../base/acquiring_request.dart';

part 'get_customer_request.g.dart';

/// Метод по получению данных покупателя из системы продавца.
///
/// [GetCustomerRequest](https://oplata.tinkoff.ru/develop/api/autopayments/getcustomer-request/)
@JsonSerializable(includeIfNull: false)
class GetCustomerRequest extends AcquiringRequest {
  /// Создает экземпляр метода по получению данных покупателя
  GetCustomerRequest(
    this.customerKey, {
    this.ip,
    String signToken,
  }) : super(signToken) {
    validate();
  }

  /// Преобразование json в модель
  factory GetCustomerRequest.fromJson(Map<String, dynamic> json) =>
      _$GetCustomerRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.getCustomer;

  @override
  Map<String, dynamic> toJson() => _$GetCustomerRequestToJson(this);

  @override
  GetCustomerRequest copyWith({
    String customerKey,
    String ip,
    String signToken,
  }) {
    return GetCustomerRequest(
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
