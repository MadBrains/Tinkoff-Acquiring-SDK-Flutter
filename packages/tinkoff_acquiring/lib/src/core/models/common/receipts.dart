import 'package:json_annotation/json_annotation.dart';

import '../base/base_request.dart';
import '../enums/taxation.dart';
import 'items.dart';

part 'receipts.g.dart';

/// Данные для каждого ShopCode
///
/// [Receipts](https://oplata.tinkoff.ru/develop/api/payments/init-request/#Receipts)
@JsonSerializable(includeIfNull: false)
class Receipts extends BaseRequest {
  /// Создает экземпляр данных чека
  Receipts({
    required this.shopCode,
    required this.items,
    required this.taxation,
    this.email,
    this.phone,
  });

  /// Преобразование json в модель
  factory Receipts.fromJson(Map<String, dynamic> json) =>
      _$ReceiptsFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.shopCode: shopCode,
        JsonKeys.taxation: taxation,
        JsonKeys.items: items,
        JsonKeys.email: email,
        JsonKeys.phone: phone,
      };

  @override
  Map<String, dynamic> toJson() => _$ReceiptsToJson(this);

  @override
  Receipts copyWith({
    String? shopCode,
    List<Items>? items,
    String? email,
    String? phone,
    Taxation? taxation,
  }) {
    return Receipts(
      shopCode: shopCode ?? this.shopCode,
      items: items ?? this.items,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      taxation: taxation ?? this.taxation,
    );
  }

  @override
  void validate() {
    for (int i = 0; i < items.length; i++) {
      items[i].validate();
    }

    assert(email != null || phone != null);
    email.validateEmail(JsonKeys.email);
    phone.validateEmail(JsonKeys.phone);
  }

  /// Код магазина.
  /// Для параметра ShopСode необходимо использовать значение параметра Submerchant_ID,
  /// полученного при регистрации партнеров через xml или API
  @JsonKey(name: JsonKeys.shopCode)
  final String? shopCode;

  /// Массив позиций чека с информацией о товарах.
  ///
  /// См. Структура объекта [Items]
  @JsonKey(name: JsonKeys.items)
  final List<Items> items;

  /// Электронная почта покупателя
  ///
  /// Пример: `a@test.ru`
  @JsonKey(name: JsonKeys.email)
  final String? email;

  /// Телефон покупателя
  ///
  /// В формате +{Ц}
  ///
  /// Пример: `+71234567890`
  @JsonKey(name: JsonKeys.phone)
  final String? phone;

  /// Система налогообложения:
  /// 1. osn — общая
  /// 2. usn_income — упрощенная (доходы)
  /// 3. usn_income_outcome — упрощенная (доходы минус расходы)
  /// 4. patent — патентная
  /// 5. envd — единый налог на вмененный доход
  /// 5. esn — единый сельскохозяйственный налог
  @JsonKey(name: JsonKeys.taxation)
  final Taxation taxation;
}
