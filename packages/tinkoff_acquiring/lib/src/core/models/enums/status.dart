import 'package:json_annotation/json_annotation.dart';

/// Статус в ответе на запрос методов
///
/// [Status](https://www.tinkoff.ru/kassa/develop/api/payments/)
enum Status {
  /// не существует
  notExist,

  /// NEW - Создан
  ///
  /// Платеж зарегистрирован в шлюзе, но его обработка в процессинге не начата
  @JsonValue('NEW')
  newest,

  /// FORM_SHOWED - Платежная форма открыта покупателем
  ///
  /// Покупатель переправлен на страницу оплаты
  @JsonValue('FORM_SHOWED')
  formShowed,

  /// DEADLINE_EXPIRED - Просрочен
  ///
  /// Платежная сессия закрыта в связи с превышением срока отсутствия активности по текущему статусу
  @JsonValue('DEADLINE_EXPIRED')
  deadlineExpired,

  /// CANCELED - Отменен
  ///
  /// Платеж отменен Продавцом
  @JsonValue('CANCELED')
  canceled,

  /// PREAUTHORIZING - Проверка платежных данных
  ///
  /// Проверка платежных данных Покупателя
  @JsonValue('PREAUTHORIZING')
  preAuthorizing,

  /// AUTHORIZING - Покупатель начал аутентификацию
  ///
  /// Покупатель начал аутентификацию
  @JsonValue('AUTHORIZING')
  authorizing,

  /// AUTH_FAIL - Не прошел авторизацию
  ///
  /// Не пройдена проверка по протоколу 3-D Secure
  @JsonValue('AUTH_FAIL')
  authFail,

  /// REJECTED - Отклонен
  ///
  /// Платеж отклонен Банком
  @JsonValue('REJECTED')
  rejected,

  /// 3DS_CHECKING - Проверяется по протоколу 3-D Secure
  ///
  /// Покупатель начал аутентификацию по протоколу 3-D Secure.
  /// Сессии, находящиеся в статусе 3DS_CHECKING более 36 часов, будут автоматически закрываться.
  ///
  /// Если в ответе метода FinishAuthorize возвращается статус 3DS_CHECKING,
  /// мерчанту необходимо сформировать запрос на URL ACS банка, выпустившего карту (в ответе параметр ACSUrl).
  /// URL: ACSUrl (возвращается в ответе метода FinishAuthorize/AttachCard)
  @JsonValue('3DS_CHECKING')
  threeDsChecking,

  /// 3DS_CHECKED - Проверен по протоколу 3-D Secure
  ///
  /// Покупатель завершил аутентификацию по протоколу 3-D Secure
  @JsonValue('3DS_CHECKED')
  threeDsChecked,

  /// PAY_CHECKING - Платеж обрабатывается
  ///
  /// Платеж обрабатывается
  @JsonValue('PAY_CHECKING')
  payChecked,

  /// AUTHORIZED - Средства заблокированы, но не списаны
  ///
  /// Средства заблокированы, но не списаны
  @JsonValue('AUTHORIZED')
  authorized,

  /// REVERSING - Резервирование отменяется
  ///
  /// Начало отмены блокировки средств
  @JsonValue('REVERSING')
  reversing,

  /// PARTIAL_REVERSED - Резервирование отменено частично
  @JsonValue('PARTIAL_REVERSED')
  partialReversed,

  /// REVERSED - Резервирование отменено
  ///
  /// Денежные средства разблокированы
  @JsonValue('REVERSED')
  reversed,

  /// CONFIRMING - Подтверждается
  ///
  /// Начало списания денежных средств
  @JsonValue('CONFIRMING')
  confirming,

  /// CONFIRM_CHECKING - Платеж обрабатывается
  ///
  /// Платеж обрабатывается
  @JsonValue('CONFIRM_CHECKING')
  confirmChecking,

  /// CONFIRMED - Подтвержден
  ///
  /// Денежные средства списаны
  @JsonValue('CONFIRMED')
  confirmed,

  /// REFUNDING - Возвращается
  ///
  /// Начало возврата денежных средств
  @JsonValue('REFUNDING')
  refunding,

  /// ASYNC_REFUNDING - Обработка возврата денежных средств по QR
  ///
  /// Обработка возврата денежных средств по QR
  @JsonValue('ASYNC_REFUNDING')
  asyncRefunding,

  /// PARTIAL_REFUNDED - Возвращен частично
  ///
  /// Произведен частичный возврат денежных средств
  @JsonValue('PARTIAL_REFUNDED')
  partialRefunded,

  /// REFUNDED - Возвращен полностью
  ///
  /// Произведен возврат денежных средств
  @JsonValue('REFUNDED')
  refunded,

  /// UNKNOWN
  ///
  /// Статус не определен
  @JsonValue('UNKNOWN')
  unknown,

  /// LOOP_CHECKING
  @Deprecated(
    '''
LOOP_CHECKING больше не используется.
Если вы его получили, обратитесь в тех. поддержку
''',
  )
  @JsonValue('LOOP_CHECKING')
  loopChecking,

  /// LOOP_CHECKED
  @Deprecated(
    '''
LOOP_CHECKED больше не используется.
Если вы его получили, обратитесь в тех. поддержку
''',
  )
  @JsonValue('LOOP_CHECKED')
  loopChecked,

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
