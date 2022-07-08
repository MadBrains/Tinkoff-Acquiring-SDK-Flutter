import 'package:json_annotation/json_annotation.dart';

/// Статус в ответе на запрос методов
///
/// [Status](https://www.tinkoff.ru/kassa/develop/api/payments/)
enum Status {
  /// не существует
  notExist,

  /// NEW - Создан
  @JsonValue('NEW')
  newest,

  /// FORM_SHOWED - Платежная форма открыта покупателем
  @JsonValue('FORM_SHOWED')
  formShowed,

  /// DEADLINE_EXPIRED - Просрочен
  @JsonValue('DEADLINE_EXPIRED')
  deadlineExpired,

  /// CANCELED - Отменен
  @JsonValue('CANCELED')
  canceled,

  /// PREAUTHORIZING - Проверка платежных данных
  @JsonValue('PREAUTHORIZING')
  preAuthorizing,

  /// AUTHORIZING - Резервируется
  @JsonValue('AUTHORIZING')
  authorizing,

  /// AUTH_FAIL - Не прошел авторизацию
  @JsonValue('AUTH_FAIL')
  authFail,

  /// REJECTED - Отклонен
  @JsonValue('REJECTED')
  rejected,

  /// 3DS_CHECKING - Проверяется по протоколу 3-D Secure
  @JsonValue('3DS_CHECKING')
  threeDsChecking,

  /// 3DS_CHECKED - Проверен по протоколу 3-D Secure
  @JsonValue('3DS_CHECKED')
  threeDsChecked,

  /// PAY_CHECKING - Платеж обрабатывается
  @JsonValue('PAY_CHECKING')
  payChecked,

  /// AUTHORIZED - Зарезервирован
  @JsonValue('AUTHORIZED')
  authorized,

  /// REVERSING - Резервирование отменяется
  @JsonValue('REVERSING')
  reversing,

  /// PARTIAL_REVERSED - Резервирование отменено частично
  @JsonValue('PARTIAL_REVERSED')
  partialReversed,

  /// REVERSED - Резервирование отменено
  @JsonValue('REVERSED')
  reversed,

  /// CONFIRMING - Подтверждается
  @JsonValue('CONFIRMING')
  confirming,

  /// CONFIRM_CHECKING - Платеж обрабатывается
  @JsonValue('CONFIRM_CHECKING')
  confirmChecking,

  /// CONFIRMED - Подтвержден
  @JsonValue('CONFIRMED')
  confirmed,

  /// REFUNDING - Возвращается
  @JsonValue('REFUNDING')
  refunding,

  /// ASYNC_REFUNDING - Обработка возврата денежных средств по QR
  @JsonValue('ASYNC_REFUNDING')
  asyncRefunding,

  /// PARTIAL_REFUNDED - Возвращен частично
  @JsonValue('PARTIAL_REFUNDED')
  partialRefunded,

  /// REFUNDED - Возвращен полностью
  @JsonValue('REFUNDED')
  refunded,

  /// UNKNOWN
  @JsonValue('UNKNOWN')
  unknown,

  /// LOOP_CHECKING
  @JsonValue('LOOP_CHECKING')
  loopChecking,

  /// COMPLETED
  @JsonValue('COMPLETED')
  completed,

  /// PROCCESING
  @JsonValue('PROCCESING')
  proccesing,

  /// ACTIVE
  @JsonValue('ACTIVE')
  active,

  /// INACITVE
  @JsonValue('INACITVE')
  inacitve,
}
