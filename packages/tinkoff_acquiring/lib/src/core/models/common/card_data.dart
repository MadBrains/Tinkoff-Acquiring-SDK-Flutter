import 'package:comparer/comparer.dart';
import 'package:meta/meta.dart';

import '../../../constants.dart';
import '../../../utils/card_validator.dart';
import '../../../utils/crypto_utils.dart';

/// Данные карты
///
/// [CardData](https://oplata.tinkoff.ru/develop/api/payments/finishAuthorize-request/#CardData)
@immutable
class CardData extends ComparerMap {
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

  /// Метод проверяет валидность данных
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

  /// Метод шифрует данные карты
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
