import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_request.dart';

part 'submit_random_amount_request.g.dart';

/// Метод предназначен для подтверждения карты путем блокировки случайной суммы.
///
/// [SubmitRandomAmountRequest](http://static2.tinkoff.ru/acquiring/manuals/android_sdk.pdf)
@JsonSerializable(includeIfNull: false)
class SubmitRandomAmountRequest extends AcquiringRequest {
  /// Создает экземпляр метода для подтверждения карты путем блокировки случайной суммы.
  SubmitRandomAmountRequest({
    required this.requestKey,
    required this.amount,
    String? signToken,
  }) : super(signToken);

  /// Преобразование json в модель
  factory SubmitRandomAmountRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitRandomAmountRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.submitRandomAmount;

  @override
  Map<String, dynamic> toJson() => _$SubmitRandomAmountRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.requestKey: requestKey,
        JsonKeys.amount: amount,
      };

  @override
  SubmitRandomAmountRequest copyWith({
    String? signToken,
    String? requestKey,
    int? amount,
  }) {
    return SubmitRandomAmountRequest(
      signToken: signToken ?? this.signToken,
      requestKey: requestKey ?? this.requestKey,
      amount: amount ?? this.amount,
    );
  }

  @override
  void validate() {
    amount.validateAmount(JsonKeys.amount);
  }

  /// Идентификатор запроса на привязку карты
  @JsonKey(name: JsonKeys.requestKey)
  final String requestKey;

  /// Сумма в копейках
  @JsonKey(name: JsonKeys.amount)
  final int amount;
}
