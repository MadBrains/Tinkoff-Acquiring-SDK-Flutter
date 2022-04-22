import 'package:comparer/comparer.dart';
import 'package:meta/meta.dart';

import '../../../constants.dart';
import '../../../utils/card_validator.dart';
import '../../../utils/crypto_utils.dart';

/// Интерфейс данных карты
abstract class CardSource {
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

    return CryptoUtils.base64(CryptoUtils.rsa(
      mergedData.toString(),
      publicKey,
    ));
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
      return CryptoUtils.base64(CryptoUtils.rsa(
        _rebillId,
        publicKey,
      ));
    }

    final StringBuffer mergedData = StringBuffer();

    mergedData.write('${JsonKeys.cardId}=$cardId;');
    mergedData.write('${JsonKeys.cvv}=$cvv');

    return CryptoUtils.base64(CryptoUtils.rsa(
      mergedData.toString(),
      publicKey,
    ));
  }
}
