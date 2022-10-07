import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_request.dart';

part 'sbp_pay_test_request.g.dart';

/// Тестирование платежной сессии с предопределенным статусом по СБП.
///
/// [SbpPayTestRequest](https://www.tinkoff.ru/kassa/develop/api/payments-sbp/sbppaytest-request/)
///
/// ---
///
/// 3.10.1 Сценарий “Платеж-успех”
/// 1) Инициировать начало платежной сессии – вызывать метод Init.
/// 2) Запросить формирование Динамического QR-кода GetQr.
/// 3) Отобразить Динамический QR-код на странице Покупателю.
/// 4) Вызвать метод SbpPayTest, передавая в нем внутренний идентификатор платежной сессии Банка (PaymentId).
/// 5) Запросить текущий статус платежа вызывая метод GetState.
/// 6) Получить ответ со статусом CONFIRMED.
///
/// ---
///
/// 3.10.2 Сценарий “Платеж - отказ по таймауту”
/// 1) Инициировать начало платежной сессии – вызывать метод Init.
/// 2) Запросить формирование Динамического QR-кода GetQr.
/// 3) Отобразить Динамический QR-код на странице Покупателю.
/// 4) Вызвать метод SbpPayTest, передавая в нем внутренний идентификатор платежной сессии Банка (PaymentId) и параметр IsDeadlineExpired = true.
/// 5) Запросить текущий статус платежа вызывая метод GetState.
/// 6) Получить ответ со статусом DEADLINE_EXPIRED.
///
/// ---
///
/// 3.10.3 Сценарий “Платеж – отказ, отклонен Банком”
/// 1) Инициировать начало платежной сессии – вызывать метод Init.
/// 2) Запросить формирование Динамического QR-кода GetQr.
/// 3) Отобразить Динамический QR-код на странице Покупателю.
/// 4) Вызвать метод SbpPayTest, передавая в нем внутренний идентификатор платежной сессии Банка (PaymentId) и параметр IsRejected = true.
/// 5) Запросить текущий статус платежа вызывая метод GetState.
/// 6) Получить ответ со статусом REJECTED.
///
/// ---
///
/// 3.10.4 Сценарий “Возврат – успех
/// 1) Инициировать возврат (не отмену) методом Cancel тестового платежа по QR-коду СБП, выполненного успешно в тесте 3.10.1
/// 2) Запросить текущий статус платежа вызывая метод GetState.
/// 3) Получить ответ со статусом REFUNDED.
@JsonSerializable(includeIfNull: false)
class SbpPayTestRequest extends AcquiringRequest {
  /// Создает экземпляр метода по тестированию платежной сессии с предопределенным статусом по СБП.
  SbpPayTestRequest({
    required this.paymentId,
    this.isDeadlineExpired,
    this.isRejected,
    String? signToken,
  }) : super(signToken);

  /// Преобразование json в модель
  factory SbpPayTestRequest.fromJson(Map<String, dynamic> json) =>
      _$SbpPayTestRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.sbpPayTest;

  @override
  Map<String, dynamic> toJson() => _$SbpPayTestRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
      };

  @override
  SbpPayTestRequest copyWith({
    String? signToken,
    String? paymentId,
    bool? isDeadlineExpired,
    bool? isRejected,
  }) {
    return SbpPayTestRequest(
      signToken: signToken ?? this.signToken,
      paymentId: paymentId ?? this.paymentId,
      isDeadlineExpired: isDeadlineExpired ?? this.isDeadlineExpired,
      isRejected: isRejected ?? this.isRejected,
    );
  }

  @override
  void validate() {
    paymentId.validateId(JsonKeys.paymentId);
  }

  /// Уникальный идентификатор транзакции в системе Банка
  @JsonKey(name: JsonKeys.paymentId)
  final String paymentId;

  /// Признак эмуляции отказа проведения платежа Банком по таймауту.
  /// По умолчанию не используется (эмуляция не требуется).
  /// - `false` – эмуляция не требуется
  /// - `true` – требуется эмуляция (не может быть использован вместе с `IsRejected = true`)
  @JsonKey(name: JsonKeys.isDeadlineExpired)
  final bool? isDeadlineExpired;

  /// Признак эмуляции отказа Банка в проведении платежа
  /// По умолчанию не используется (эмуляция не требуется)
  /// - `false` – эмуляция не требуется
  /// - `true` – требуется эмуляция (не может быть использован вместе с IsDeadlineExpired = true)
  @JsonKey(name: JsonKeys.isRejected)
  final bool? isRejected;
}
