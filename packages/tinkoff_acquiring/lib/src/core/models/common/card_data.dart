import 'package:comparer/comparer.dart';
import 'package:meta/meta.dart';

import '../../../constants.dart';
import '../../../utils/card_validator.dart';
import '../../../utils/crypto_utils.dart';

/// Источник оплаты
abstract class PaymentSource {
  /// Источник оплаты
  const PaymentSource();

  /// Тип оплаты с помощью Google Pay
  const factory PaymentSource.googlePay(String token) = GooglePayData;

  /// Тип оплаты с помощью Apple Pay
  const factory PaymentSource.applePay(String token) = ApplePayData;

  /// Данные карты
  factory PaymentSource.card({
    required String pan,
    required String expDate,
    required String cvv,
    String? cardHolder,
  }) = CardData;

  /// Данные привязанной карты на основе [cardId]
  factory PaymentSource.attachedCard({
    required String? cardId,
    required String? cvv,
  }) = AttachedCardData.card;

  /// Данные привязанной карты на основе [rebillId]
  factory PaymentSource.attachedRebill({required String? rebillId}) =
      AttachedCardData.rebill;

  /// Зашифрованные данные карты
  String cardData(String publicKey);
}

/// Тип оплаты с помощью Google Pay
class GooglePayData implements PaymentSource {
  /// Тип оплаты с помощью Google Pay
  const GooglePayData(this.token);

  /// Токен для оплаты, полученный через Google Pay.
  ///
  /// Можно использовать [mad_pay](https://pub.dev/packages/mad_pay)
  final String token;

  // publicKey не используется
  @override
  String cardData(String publicKey) => token;
}

/// Тип оплаты с помощью Apple Pay
class ApplePayData implements PaymentSource {
  /// Тип оплаты с помощью Apple Pay
  const ApplePayData(this.token);

  /// Токен для оплаты, полученный через Apple Pay.
  ///
  /// Можно использовать [mad_pay](https://pub.dev/packages/mad_pay)
  final String token;

  // publicKey не используется
  @override
  String cardData(String publicKey) => token;
}

/// Интерфейс данных карты
abstract class CardSource implements PaymentSource {
  /// Интерфейс данных карты
  const CardSource();

  /// Метод шифрует данные карты
  String encode(String publicKey);

  /// Метод проверяет валидность данных
  void validate();
}

/// Данные карты
///
/// [CardData](https://oplata.tinkoff.ru/develop/api/payments/finishAuthorize-request/#CardData)
@immutable
class CardData extends ComparerMap implements CardSource {
  /// Создает экземпляр данных кард
  CardData({
    required this.pan,
    required this.expDate,
    required this.cvv,
    this.cardHolder,
  });

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.pan: pan,
        JsonKeys.expDate: expDate,
        JsonKeys.cvv: cvv,
        JsonKeys.cardHolder: cardHolder,
      };

  @override
  String cardData(String publicKey) => encode(publicKey);

  /// Номер карты
  final String pan;

  /// Месяц и год срока действия карты
  ///
  /// В формате MMYY
  final String expDate;

  /// Код защиты
  final String cvv;

  /// Имя и фамилия держателя карты (как на карте)
  final String? cardHolder;

  /// Создает экземпляр с заданными параметрами
  CardData copyWith({
    String? pan,
    String? expDate,
    String? cvv,
    String? cardHolder,
  }) {
    return CardData(
      pan: pan ?? this.pan,
      expDate: expDate ?? this.expDate,
      cvv: cvv ?? this.cvv,
      cardHolder: cardHolder ?? this.cardHolder,
    );
  }

  @override
  void validate() {
    String? wrongField;

    if (!CardValidator.validateCardNumber(pan)) {
      wrongField = 'номер карты';
    }

    if (!CardValidator.validateExpireDate(expDate)) {
      wrongField = 'месяц и год срока действия карты';
    }

    if (!CardValidator.validateSecurityCode(cvv)) {
      wrongField = 'код защиты';
    }

    assert(
      wrongField == null,
      'Не удается закодировать данные карты. Неправильный: $wrongField',
    );
  }

  @override
  String encode(String publicKey) {
    validate();

    final StringBuffer mergedData = StringBuffer();

    mergedData.write('${JsonKeys.pan.toUpperCase()}=$pan;');
    mergedData.write('${JsonKeys.expDate}=$expDate;');
    if (cardHolder != null) {
      mergedData.write('${JsonKeys.cardHolder}=$cardHolder;');
    }
    mergedData.write('${JsonKeys.cvv}=$cvv');

    return CryptoUtils.base64(
      CryptoUtils.rsa(
        mergedData.toString(),
        publicKey,
      ),
    );
  }
}

/// Данные привязанной карты
@immutable
class AttachedCardData extends ComparerMap implements CardSource {
  /// Создать привязанную карту на основе [cardId]
  AttachedCardData.card({required this.cardId, required this.cvv})
      : rebillId = null;

  /// Создать привязанную карту на основе [rebillId]
  AttachedCardData.rebill({required this.rebillId})
      : cardId = null,
        cvv = null;

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.pan: cardId,
        JsonKeys.cvv: cvv,
        JsonKeys.rebillId: rebillId,
      };

  @override
  String cardData(String publicKey) => encode(publicKey);

  /// Номер карты
  final String? cardId;

  /// Код защиты
  final String? cvv;

  /// Идентификатор рекуррентного платежа в системе банка
  final String? rebillId;

  @override
  void validate() {
    String? wrongField;

    final String? _cardId = cardId;
    final String? _rebillId = rebillId;
    final String? _cvv = cvv;

    if ((_rebillId != null) || (_cardId != null && _cvv != null)) {
      if (_cvv != null && !CardValidator.validateSecurityCode(_cvv)) {
        wrongField = 'код защиты';
      }
    } else {
      wrongField = 'нет данных для кодировки';
    }

    assert(
      wrongField == null,
      'Не удается закодировать данные карты. Неправильный: $wrongField',
    );
  }

  @override
  String encode(String publicKey) {
    validate();

    final String? _rebillId = rebillId;
    if (_rebillId != null) {
      return CryptoUtils.base64(
        CryptoUtils.rsa(
          _rebillId,
          publicKey,
        ),
      );
    }

    final StringBuffer mergedData = StringBuffer();

    mergedData.write('${JsonKeys.cardId}=$cardId;');
    mergedData.write('${JsonKeys.cvv}=$cvv');

    return CryptoUtils.base64(
      CryptoUtils.rsa(
        mergedData.toString(),
        publicKey,
      ),
    );
  }
}
