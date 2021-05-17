import '../constants.dart';

/// Тип платежной системы
enum CardPaymentSystem {
  /// Неизвестный
  unknown,

  /// MasterCard
  masterCard,

  /// Mestro
  mestro,

  /// Mir
  mir,

  /// Visa
  visa,
}

/// Расширение для работы с типом платежной системы
extension CardPaymentSystemX on CardPaymentSystem {
  /// Узнать тип платежной системы по номеру карты
  static CardPaymentSystem resolvePaymentSystem(String cardNumber) {
    if (cardNumber.length >= 4) {
      if (CardSettings.mirPattern.hasMatch(cardNumber)) {
        return CardPaymentSystem.mir;
      }

      final String firstChar = cardNumber[0];
      if (firstChar == '2' || firstChar == '5') {
        return CardPaymentSystem.masterCard;
      }

      if (firstChar == '4') {
        return CardPaymentSystem.visa;
      }

      if (firstChar == '6') {
        return CardPaymentSystem.mestro;
      }
    }

    return CardPaymentSystem.unknown;
  }

  /// Узнать разрешенные количество символов для определенного типа платежной системы
  List<int> get getLengthRanges {
    switch (this) {
      case CardPaymentSystem.masterCard:
      case CardPaymentSystem.visa:
        return CardSettings.defaultRangers;
      case CardPaymentSystem.mir:
        return CardSettings.mirRanges;
      case CardPaymentSystem.mestro:
        return CardSettings.maestroRangers;
      default:
        return CardSettings.unknownRangers;
    }
  }
}

/// Валидация данных карты
class CardValidator {
  /// Валидация номера карты
  static bool validateCardNumber(String cardNumber) {
    if (cardNumber.isEmpty ||
        !CardSettings.cardNumberPattern.hasMatch(cardNumber)) {
      return false;
    }

    final CardPaymentSystem cardType =
        CardPaymentSystemX.resolvePaymentSystem(cardNumber);
    final List<int> allowedLengthRanges = cardType.getLengthRanges;
    bool isLengthAllowed = false;

    for (final int allowedLength in allowedLengthRanges) {
      if (cardNumber.length == allowedLength) {
        isLengthAllowed = true;
      }
    }

    return isLengthAllowed && _validateWithLuhnAlgorithm(cardNumber);
  }

  /// Валидация даты карты
  static bool validateExpireDate(String expiryDate) {
    if (expiryDate.isEmpty || expiryDate.length != CardSettings.maxDateLength) {
      return false;
    }

    int? month;
    int? year;

    month = int.tryParse(expiryDate.substring(0, 2));
    year = int.tryParse(expiryDate.substring(2, 4));

    if (month == null || year == null) {
      return false;
    }

    if (month >= 1 && month <= 12) {
      final DateTime currentDateTime = DateTime.now();
      final int currentMonth = currentDateTime.month;
      final String currentYearStr =
          currentDateTime.year.toString().substring(2);
      final int currentYear = int.parse(currentYearStr);

      if (year == currentYear && month >= currentMonth) {
        return true;
      }
      if (year > currentYear && year <= currentYear + 20) {
        return true;
      }
    }

    return false;
  }

  /// Валидация кода защиты карты
  static bool validateSecurityCode(String cvc) {
    if (cvc.isEmpty || cvc.length != CardSettings.maxCvcLength) {
      return false;
    }

    return CardSettings.cvcCodePattern.hasMatch(cvc);
  }

  // http://en.wikipedia.org/wiki/Luhn_algorithm
  static bool _validateWithLuhnAlgorithm(String cardNumber) {
    int sum = 0;
    int? value;
    for (int i = 0; i < cardNumber.split('').reversed.length; i++) {
      value = int.tryParse(cardNumber[i]);
      if (value == null) {
        return false;
      }
      final bool shouldBeDoubled = (cardNumber.length - i) % 2 == 0;
      if (shouldBeDoubled) {
        value *= 2;
        sum += value > 9 ? 1 + value % 10 : value;
      } else {
        sum += value;
      }
    }
    return sum % 10 == 0;
  }
}
