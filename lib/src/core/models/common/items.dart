import 'package:json_annotation/json_annotation.dart';

import '../../constants.dart';
import 'agent_data.dart';
import 'supplier_info.dart';
import '../enums/payment_method.dart';
import '../enums/payment_object.dart';
import '../enums/tax.dart';

part 'items.g.dart';

/// Массив позиций чека с информацией о товарах.
///
/// [Items](https://oplata.tinkoff.ru/develop/api/payments/init-request/#Items)
@JsonSerializable(includeIfNull: false)
class Items {
  /// Создает экземпляр массива позиций чека с информацией о товарах.
  Items(
    this.name,
    this.quantity,
    this.amount,
    this.price,
    this.tax, {
    this.paymentMethod,
    this.paymentObject,
    this.ean13,
    this.shopCode,
    this.agentData,
    this.supplierInfo,
  });

  /// Преобразование json в модель
  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  /// Преобразование модели в json
  Map<String, dynamic> toJson() => _$ItemsToJson(this);

  /// Метод проверяет валидность данных
  void validate() {
    assert(quantity.length <= 8);
    assert(amount.length <= 10);
    assert(price.length <= 10);
    if (ean13 != null) {
      assert(ean13.length <= 20);
    }
    if (shopCode != null) {
      assert(shopCode.length <= 64);
    }
    if (supplierInfo != null) {
      assert(agentData != null && agentData.agentSign != null);
      supplierInfo.validate();
    }
    if (agentData != null) {
      agentData.validate();
    }
  }

  /// Наименование товара
  @JsonKey(name: JsonKeys.name)
  final String name;

  /// Количество или вес товара
  ///
  /// Пример: `3.00` == `3 шт/кг`
  @JsonKey(name: JsonKeys.quantity)
  final String quantity;

  /// Стоимость товара в копейках
  ///
  /// Произведение [quantity] и [price]
  ///
  /// Пример: `3.00` * `300000` = `90000` (`9000.00 рублей`)
  @JsonKey(name: JsonKeys.amount)
  final String amount;

  /// Цена за единицу товара в копейках
  ///
  /// Пример: `300000` == `3000.00 рублей`
  @JsonKey(name: JsonKeys.price)
  final String price;

  /// Признак способа расчета:
  /// 1. full_payment — полный расчет
  /// 2. full_prepayment — предоплата 100%
  /// 3. prepayment — предоплата
  /// 4. advance — аванс
  /// 5. partial_payment — частичный расчет и кредит
  /// 6. credit — передача в кредит
  /// 7. credit_payment — оплата кредита
  @JsonKey(name: JsonKeys.paymentMethod)
  final PaymentMethod paymentMethod;

  /// Признак предмета расчета
  /// 1. commodity — товар
  /// 2. excise — подакцизный товар
  /// 3. job — работа
  /// 4. service — услуга
  /// 5. gambling_bet — ставка азартной игры
  /// 6. gambling_prize — выигрыш азартной игры
  /// 7. lottery — лотерейный билет
  /// 8. lottery_prize — выигрыш лотереи
  /// 9. intellectual_activity — предоставление результатов интеллектуальной деятельности
  /// 10. payment — платеж
  /// 11. agent_commission — агентское вознаграждение
  /// 12. composite — составной предмет расчета
  /// 13. another — иной предмет расчета
  @JsonKey(name: JsonKeys.paymentObject)
  final PaymentObject paymentObject;

  /// Ставка НДС:
  /// 1. none — без НДС
  /// 2. vat0 — 0%
  /// 3. vat10 — 10%
  /// 4. vat20 — 20%
  /// 5. vat110 — 10/110
  /// 6. vat120 — 20/120
  @JsonKey(name: JsonKeys.tax)
  final Tax tax;

  /// Маркировка товара
  @JsonKey(name: JsonKeys.ean13)
  final String ean13;

  /// Код магазина
  @JsonKey(name: JsonKeys.shopCode)
  final String shopCode;

  /// Данные агента
  ///
  /// Используется при работе по агентской схеме
  @JsonKey(name: JsonKeys.agentData)
  final AgentData agentData;

  /// Данные поставщика платежного агента
  @JsonKey(name: JsonKeys.supplierInfo)
  final SupplierInfo supplierInfo;
}
