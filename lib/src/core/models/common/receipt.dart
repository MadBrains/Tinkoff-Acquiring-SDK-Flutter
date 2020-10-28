import 'package:json_annotation/json_annotation.dart';

import '../../constants.dart';
import '../../utils/comparer.dart';
import '../enums/taxation.dart';
import 'items.dart';

part 'receipt.g.dart';

/// Данные чека
///
/// [Receipt](https://oplata.tinkoff.ru/develop/api/payments/init-request/#Receipt)
@JsonSerializable(includeIfNull: false)
class Receipt with Comparer {
  /// Создает экземпляр данных чека
  Receipt(
    this.taxation,
    this.items, {
    this.email,
    this.phone,
    this.emailCompany,
  });

  /// Преобразование json в модель
  factory Receipt.fromJson(Map<String, dynamic> json) =>
      _$ReceiptFromJson(json);

  @override
  Map<String, Object> get equals => <String, Object>{
        JsonKeys.taxation: taxation,
        JsonKeys.items: items,
        JsonKeys.email: email,
        JsonKeys.phone: phone,
        JsonKeys.emailCompany: emailCompany,
      };

  /// Преобразование модели в json
  Map<String, dynamic> toJson() => _$ReceiptToJson(this);

  /// Метод проверяет валидность данных
  void validate() {
    for (int i = 0; i < items.length; i++) {
      items[i].validate();
    }

    if (email != null || phone != null) {
      assert((email != null) ^ (phone != null));

      if (email != null) {
        final bool match =
            RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')
                .hasMatch(email);
        assert(email.length <= 100 && match);
      }
      if (phone != null) {
        final bool match = RegExp(r'^\+[0-9](?:[\d]*)$').hasMatch(phone);
        assert(phone.length <= 19 && match);
      }
    }
    if (emailCompany != null) {
      final bool match =
          RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')
              .hasMatch(emailCompany);
      assert(emailCompany.length <= 100 && match);
    }
  }

  /// Электронная почта покупателя
  ///
  /// Пример: `a@test.ru`
  @JsonKey(name: JsonKeys.email)
  final String email;

  /// Телефон покупателя
  ///
  /// В формате +{Ц}
  ///
  /// Пример: `+71234567890`
  @JsonKey(name: JsonKeys.phone)
  final String phone;

  /// Электронная почта продавца
  ///
  /// Пример: `a@test.ru`
  @JsonKey(name: JsonKeys.emailCompany)
  final String emailCompany;

  /// Система налогообложения:
  /// 1. osn — общая
  /// 2. usn_income — упрощенная (доходы)
  /// 3. usn_income_outcome — упрощенная (доходы минус расходы)
  /// 4. patent — патентная
  /// 5. envd — единый налог на вмененный доход
  /// 5. esn — единый сельскохозяйственный налог
  @JsonKey(name: JsonKeys.taxation)
  final Taxation taxation;

  /// Массив позиций чека с информацией о товарах.
  ///
  /// См. Структура объекта [Items]
  @JsonKey(name: JsonKeys.items)
  final List<Items> items;
}
