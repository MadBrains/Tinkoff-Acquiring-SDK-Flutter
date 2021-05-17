import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../../../utils/extensions.dart';
import '../base/acquiring_request.dart';

part 'get_state_request.g.dart';

/// Метод возвращает текущий статус платежа.
///
/// [GetStateRequest](https://oplata.tinkoff.ru/develop/api/payments/getstate-request/)
@JsonSerializable(includeIfNull: false)
class GetStateRequest extends AcquiringRequest {
  /// Создает экземпляр метода по получению статуса платежа
  GetStateRequest({
    required this.paymentId,
    this.ip,
    String? signToken,
  }) : super(signToken) {
    validate();
  }

  /// Преобразование json в модель
  factory GetStateRequest.fromJson(Map<String, dynamic> json) =>
      _$GetStateRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.getState;

  @override
  Map<String, dynamic> toJson() => _$GetStateRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.paymentId: paymentId,
        JsonKeys.ip: ip,
      };

  @override
  GetStateRequest copyWith({
    int? paymentId,
    String? ip,
    String? signToken,
  }) {
    return GetStateRequest(
      paymentId: paymentId ?? this.paymentId,
      ip: ip ?? this.ip,
      signToken: signToken ?? this.signToken,
    );
  }

  @override
  void validate() {
    assert(paymentId.length <= 20);

    final String? _ip = ip;
    if (_ip != null) {
      assert(_ip.length >= 7 && _ip.length <= 45);
    }
  }

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.paymentId)
  final int paymentId;

  /// IP-адрес покупателя
  @JsonKey(name: JsonKeys.ip)
  final String? ip;
}
