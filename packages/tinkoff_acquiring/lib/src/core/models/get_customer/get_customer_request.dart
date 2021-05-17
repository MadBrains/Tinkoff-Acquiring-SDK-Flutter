import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';

part 'get_customer_request.g.dart';

/// Метод по получению данных покупателя из системы продавца.
///
/// [GetCustomerRequest](https://oplata.tinkoff.ru/develop/api/autopayments/getcustomer-request/)
@JsonSerializable(includeIfNull: false)
class GetCustomerRequest extends AcquiringRequest {
  /// Создает экземпляр метода по получению данных покупателя
  GetCustomerRequest({
    required this.customerKey,
    this.ip,
    String? signToken,
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
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.customerKey: customerKey,
        JsonKeys.ip: ip,
      };

  @override
  GetCustomerRequest copyWith({
    String? customerKey,
    String? ip,
    String? signToken,
  }) {
    return GetCustomerRequest(
      customerKey: customerKey ?? this.customerKey,
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
  }

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.customerKey)
  final String customerKey;

  /// IP-адрес покупателя
  @JsonKey(name: JsonKeys.ip)
  final String? ip;
}
