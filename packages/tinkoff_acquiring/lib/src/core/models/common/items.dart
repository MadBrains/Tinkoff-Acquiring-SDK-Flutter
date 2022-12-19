import 'package:json_annotation/json_annotation.dart';

import '../base/base_request.dart';
import '../enums/payment_method.dart';
import '../enums/payment_object.dart';
import '../enums/tax.dart';
import 'agent_data.dart';
import 'mark_code.dart';
import 'mark_quantity.dart';
import 'sectoral_item_props.dart';
import 'supplier_info.dart';

part 'items.g.dart';

/// Массив позиций чека с информацией о товарах.
///
/// [Items](https://www.tinkoff.ru/kassa/develop/api/receipt#Items)
@JsonSerializable(constructor: 'all', includeIfNull: false)
class Items extends BaseRequest {
  /// Создает экземпляр массива позиций чека с информацией о товарах.
  Items.all({
    required this.name,
    required this.price,
    required this.quantity,
    required this.amount,
    required this.tax,
    this.paymentMethod,
    this.paymentObject,
    this.agentData,
    this.supplierInfo,
    this.ean13,
    this.shopCode,
    this.userData,
    this.excise,
    this.countryCode,
    this.declarationNumber,
    this.measurementUnit,
    this.markProcessingMode,
    this.markCode,
    this.markQuantity,
    this.sectoralItemProps,
  });

  /// Создает экземпляр массива позиций чека с информацией о товарах ФФД 1.05
  Items.ffd105({
    required this.name,
    required this.quantity,
    required this.amount,
    required this.price,
    required this.tax,
    this.paymentMethod,
    this.paymentObject,
    this.ean13,
    this.shopCode,
    this.agentData,
    this.supplierInfo,
  })  : userData = null,
        excise = null,
        countryCode = null,
        declarationNumber = null,
        measurementUnit = null,
        markProcessingMode = null,
        markCode = null,
        markQuantity = null,
        sectoralItemProps = null;

  /// Создает экземпляр массива позиций чека с информацией о товарах ФФД 1.2
  Items.ffd12({
    required this.name,
    required this.quantity,
    required this.amount,
    required this.price,
    required this.paymentMethod,
    required this.paymentObject,
    required this.tax,
    this.agentData,
    this.supplierInfo,
    this.userData,
    this.excise,
    this.countryCode,
    this.declarationNumber,
    this.measurementUnit,
    this.markProcessingMode,
    this.markCode,
    this.markQuantity,
    this.sectoralItemProps,
  })  : ean13 = null,
        shopCode = null;

  /// Преобразование json в модель
  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.name: name,
        JsonKeys.quantity: quantity,
        JsonKeys.amount: amount,
        JsonKeys.price: price,
        JsonKeys.tax: tax,
        JsonKeys.paymentMethod: paymentMethod,
        JsonKeys.paymentObject: paymentObject,
        JsonKeys.agentData: agentData,
        JsonKeys.supplierInfo: supplierInfo,
        JsonKeys.ean13: ean13,
        JsonKeys.shopCode: shopCode,
        JsonKeys.userData: userData,
        JsonKeys.excise: excise,
        JsonKeys.countryCode: countryCode,
        JsonKeys.declarationNumber: declarationNumber,
        JsonKeys.measurementUnit: measurementUnit,
        JsonKeys.markProcessingMode: markProcessingMode,
        JsonKeys.markCode: markCode,
        JsonKeys.markQuantity: markQuantity,
        JsonKeys.sectoralItemProps: sectoralItemProps,
      };

  @override
  Map<String, dynamic> toJson() => _$ItemsToJson(this);

  @override
  Items copyWith({
    String? name,
    int? quantity,
    int? amount,
    int? price,
    PaymentMethod? paymentMethod,
    PaymentObject? paymentObject,
    Tax? tax,
    AgentData? agentData,
    SupplierInfo? supplierInfo,
    String? ean13,
    String? shopCode,
    String? userData,
    int? excise,
    String? countryCode,
    String? declarationNumber,
    String? measurementUnit,
    String? markProcessingMode,
    MarkCode? markCode,
    MarkQuantity? markQuantity,
    List<SectoralItemProps>? sectoralItemProps,
  }) {
    return Items.all(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      amount: amount ?? this.amount,
      price: price ?? this.price,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentObject: paymentObject ?? this.paymentObject,
      tax: tax ?? this.tax,
      agentData: agentData ?? this.agentData,
      supplierInfo: supplierInfo ?? this.supplierInfo,
      ean13: ean13 ?? this.ean13,
      shopCode: shopCode ?? this.shopCode,
      userData: userData ?? this.userData,
      excise: excise ?? this.excise,
      countryCode: countryCode ?? this.countryCode,
      declarationNumber: declarationNumber ?? this.declarationNumber,
      measurementUnit: measurementUnit ?? this.measurementUnit,
      markProcessingMode: markProcessingMode ?? this.markProcessingMode,
      markCode: markCode ?? this.markCode,
      markQuantity: markQuantity ?? this.markQuantity,
      sectoralItemProps: sectoralItemProps ?? this.sectoralItemProps,
    );
  }

  @override
  void validate() {
    agentData?.validate();
    supplierInfo?.validate();
    assert(
      () {
        if (agentData?.agentSign != null) {
          return supplierInfo != null;
        }

        return true;
      }(),
    );

    quantity.validateQuantity(JsonKeys.quantity);
    price.validateAmount(JsonKeys.price);
    amount.validateAmount(JsonKeys.amount);
  }

  /// Наименование товара
  ///
  /// Максимум 128 символов
  @JsonKey(name: JsonKeys.name)
  final String name;

  /// Количество или вес товара
  ///
  /// - целая часть не более 8 знаков
  /// - дробная часть не более 3 знаков для Атол, не более 2 знаков для CloudPyments
  ///
  /// Пример: `3.00` == `3 шт/кг`
  @JsonKey(name: JsonKeys.quantity)
  final int quantity;

  /// Стоимость товара в копейках
  ///
  /// Произведение [quantity] и [price]
  ///
  /// Целочисленное значение не более 10 знаков
  ///
  /// Пример: `3.00` * `300000` = `90000` (`9000.00 рублей`)
  @JsonKey(name: JsonKeys.amount)
  final int amount;

  /// Цена за единицу товара в копейках
  ///
  /// Пример: `300000` == `3000.00 рублей`
  @JsonKey(name: JsonKeys.price)
  final int price;

  /// Признак способа расчета. Если значение не передано,
  /// по умолчанию в онлайн-кассу передается признак способа расчёта "full_payment".
  ///
  /// Возможные значения:
  /// 1. full_payment — полный расчет
  /// 2. full_prepayment — предоплата 100%
  /// 3. prepayment — предоплата
  /// 4. advance — аванс
  /// 5. partial_payment — частичный расчет и кредит
  /// 6. credit — передача в кредит
  /// 7. credit_payment — оплата кредита
  @JsonKey(name: JsonKeys.paymentMethod)
  final PaymentMethod? paymentMethod;

  /// Признак предмета расчета. Если значение не передано,
  /// по умолчанию в онлайн-кассу передается признак предмета расчёта "commodity".
  ///
  /// Возможные значения:
  /// - commodity — товар
  /// - excise — подакцизный товар
  /// - job — работа
  /// - service — услуга
  /// - gambling_bet — ставка азартной игры
  /// - gambling_prize — выигрыш азартной игры
  /// - lottery — лотерейный билет
  /// - lottery_prize — выигрыш лотереи
  /// - intellectual_activity — предоставление результатов интеллектуальной деятельности
  /// - payment — платеж
  /// - agent_commission — агентское вознаграждение
  /// - composite — составной предмет расчета, только для ФФД 1.05
  /// - another — иной предмет расчета
  /// - contribution — выплата, только для ФФД 1.2
  /// - property_rights — имущественное право, только для ФФД 1.2
  /// - unrealization — внереализационный доход, только для ФФД 1.2
  /// - tax_reduction — иные платежи и взносы, только для ФФД 1.2
  /// - trade_fee — торговый сбор, только для ФФД 1.2
  /// - resort_tax — курортный сбор, только для ФФД 1.2
  /// - pledge — залог, только для ФФД 1.2
  /// - income_decrease — расход, только для ФФД 1.2
  /// - ie_pension_insurance_without_payments — взносы на ОПС ИП, только для ФФД 1.2
  /// - ie_pension_insurance_with_payments — взносы на ОПС, только для ФФД 1.2
  /// - ie_medical_insurance_without_payments — взносы на ОМС ИП, только для ФФД 1.2
  /// - ie_medical_insurance_with_payments — взносы на ОМС, только для ФФД 1.2
  /// - social_insurance — взносы на ОСС, только для ФФД 1.2
  /// - casino_chips — платеж казино, только для ФФД 1.2
  /// - agent_payment — выдача ДС, только для ФФД 1.2
  /// - excisable_goods_without_marking_code — АТНМ, только для ФФД 1.2
  /// - excisable_goods_with_marking_code — АТМ, только для ФФД 1.2
  /// - goods_without_marking_code — ТНМ, только для ФФД 1.2
  /// - goods_with_marking_code — ТМ, только для ФФД 1.2
  @JsonKey(name: JsonKeys.paymentObject)
  final PaymentObject? paymentObject;

  /// Ставка НДС:
  /// - none — без НДС
  /// - vat0 — 0%
  /// - vat10 — 10%
  /// - vat18 — 18%
  /// - vat20 — 20%
  /// - vat110 — 10/110
  /// - vat118 — 18/118
  /// - vat120 — 20/120
  @JsonKey(name: JsonKeys.tax)
  final Tax tax;

  /// Данные агента
  ///
  /// Используется при работе по агентской схеме
  @JsonKey(name: JsonKeys.agentData)
  final AgentData? agentData;

  /// Данные поставщика платежного агента
  @JsonKey(name: JsonKeys.supplierInfo)
  final SupplierInfo? supplierInfo;

  /// Только для ФФД 1.05.
  ///
  /// Штрих-код в требуемом формате. В зависимости от типа кассы требования могут отличаться:
  ///
  /// - АТОЛ Онлайн - шестнадцатеричное представление с пробелами.
  /// Максимальная длина – 32 байта.
  /// Пример: 00 00 00 01 00 21 FA 41 00 23 05 41 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 12 00 AB 00
  ///
  /// - CloudKassir - длина строки: четная, от 8 до 150 байт,
  /// т.е. от 16 до 300 ASCII символов ['0' - '9' , 'A' - 'F' ] шестнадцатеричного представления кода маркировки товара.
  /// Пример: 303130323930303030630333435
  ///
  /// - OrangeData - строка, содержащая base64 кодированный массив от 8 до 32 байт.
  /// Пример: igQVAAADMTIzNDU2Nzg5MDEyMwAAAAAAAQ==
  ///
  /// В случае передачи в запросе параметра Ean13 не прошедшего валидацию,
  /// возвращается неуспешный ответ с текстом ошибки в параметре message = "Неверный параметр Ean13".
  /// Валидация параметра Ean13 необходима как в объекте Receipt, так и в объекте Receipts.
  @JsonKey(name: JsonKeys.ean13)
  final String? ean13;

  /// Только для ФФД 1.05.
  ///
  /// Код магазина. Для параметра ShopСode необходимо использовать значение параметра Submerchant_ID,
  /// полученного в ответ при регистрации магазинов через xml. Если xml не используется, передавать поле не нужно
  @JsonKey(name: JsonKeys.shopCode)
  final String? shopCode;

  /// Только для ФФД 1.2.
  ///
  /// Дополнительный реквизит предмета расчета
  @JsonKey(name: JsonKeys.userData)
  final String? userData;

  /// Только для ФФД 1.2.
  ///
  /// Сумма акциза в рублях с учетом копеек, включенная в стоимость предмета расчета.
  /// Целая часть не более 8 знаков, дробная часть не более 2 знаков. Значение не может быть отрицательным.
  @JsonKey(name: JsonKeys.excise)
  final int? excise;

  /// Только для ФФД 1.2.
  ///
  /// Цифровой код страны происхождения товара в соответствии с Общероссийским классификатором стран мира (3 цифры)
  @JsonKey(name: JsonKeys.countryCode)
  final String? countryCode;

  /// Только для ФФД 1.2.
  ///
  /// Номер таможенной декларации (32 цифры максимум)
  @JsonKey(name: JsonKeys.declarationNumber)
  final String? declarationNumber;

  /// Только для ФФД 1.2.
  ///
  /// Единицы измерения. Передавать в соответствии с ОК 015-94 (МК 002-97)
  @JsonKey(name: JsonKeys.measurementUnit)
  final String? measurementUnit;

  /// Только для ФФД 1.2.
  ///
  /// Режим обработки кода маркировки. Должен принимать значение равное «0».
  ///
  /// Обязательный, если предметом расчета является товар,
  /// подлежащий обязательной маркировке средством идентификации (соответствующий код в поле paymentObject)
  @JsonKey(name: JsonKeys.markProcessingMode)
  final String? markProcessingMode;

  /// Только для ФФД 1.2.
  ///
  /// Код маркировки в машиночитаемой форме, представленный в виде одного из видов кодов,
  /// формируемых в соответствии с требованиями, предусмотренными правилами, для нанесения на потребительскую упаковку,
  /// или на товары, или на товарный ярлык.
  ///
  /// Обязательный, если предметом расчета является товар,
  /// подлежащий обязательной маркировке средством идентификации (соответствующий код в поле paymentObject)
  @JsonKey(name: JsonKeys.markCode)
  final MarkCode? markCode;

  /// Только для ФФД 1.2.
  ///
  /// Реквизит «дробное количество маркированного товара»
  ///
  /// Обязательный, если предметом расчета является товар,
  /// подлежащий обязательной маркировке средством идентификации (соответствующий код в поле paymentObject)
  @JsonKey(name: JsonKeys.markQuantity)
  final MarkQuantity? markQuantity;

  /// Только для ФФД 1.2.
  ///
  /// Отраслевой реквизит предмета расчета.
  /// Необходимо указывать только для товаров подлежащих обязательной маркировке средством идентификации
  /// и включение данного реквизита предусмотрено НПА отраслевого регулирования для соответствующей товарной группы.
  @JsonKey(name: JsonKeys.sectoralItemProps)
  final List<SectoralItemProps>? sectoralItemProps;
}
