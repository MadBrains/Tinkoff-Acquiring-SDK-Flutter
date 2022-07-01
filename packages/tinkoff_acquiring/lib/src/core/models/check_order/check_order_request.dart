import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_request.dart';

part 'check_order_request.g.dart';

/// Метод возвращает текущий статус платежа.
///
/// [CheckOrderRequest](https://www.tinkoff.ru/kassa/develop/api/payments/CheckOrder-description/)
@JsonSerializable(includeIfNull: false)
class CheckOrderRequest extends AcquiringRequest {
  /// Создает экземпляр метода по получению статуса платежа
  CheckOrderRequest({
    required this.orderId,
    String? signToken,
  }) : super(signToken);

  /// Преобразование json в модель
  factory CheckOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckOrderRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.checkOrder;

  @override
  Map<String, dynamic> toJson() => _$CheckOrderRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.orderId: orderId,
      };

  @override
  CheckOrderRequest copyWith({
    String? signToken,
    int? orderId,
  }) {
    return CheckOrderRequest(
      signToken: signToken ?? this.signToken,
      orderId: orderId ?? this.orderId,
    );
  }

  @override
  void validate() {
    orderId.validateId(JsonKeys.orderId);
  }

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.orderId)
  final int orderId;
}
