import 'package:json_annotation/json_annotation.dart';

import '../base/base_request.dart';
import '../enums/taxation.dart';
import 'add_user_prop.dart';
import 'client_info.dart';
import 'items.dart';
import 'operating_check_props.dart';
import 'payments.dart';
import 'sectoral_check_props.dart';

part 'receipt.g.dart';

/// Данные чека
///
/// Поля для ФФД 1.2: [customer], [customerInn], [clientInfo]
/// [Receipt](https://www.tinkoff.ru/kassa/develop/api/receipt/)
@JsonSerializable(constructor: 'all', includeIfNull: false)
class Receipt extends BaseRequest {
  /// Создает экземпляр данных чека.
  ///
  /// Внимание, тут представлены все поля.
  /// Если вам нужны ФФД определенных версий используйте нужные конструкторы.
  Receipt.all({
    required this.taxation,
    required this.items,
    required this.ffdVersion,
    this.email,
    this.phone,
    this.payments,
    this.customer,
    this.customerInn,
    this.clientInfo,
    this.operatingCheckProps,
    this.sectoralCheckProps,
    this.addUserProp,
    this.additionalCheckProps,
  });

  /// Создает экземпляр данных чека ФФД 1.05
  Receipt.ffd105({
    required this.taxation,
    required this.items,
    this.email,
    this.phone,
    this.payments,
  })  : ffdVersion = '1.05',
        customer = null,
        customerInn = null,
        clientInfo = null,
        operatingCheckProps = null,
        sectoralCheckProps = null,
        addUserProp = null,
        additionalCheckProps = null;

  /// Создает экземпляр данных чека ФФД 1.2
  Receipt.ffd12({
    required this.taxation,
    required this.items,
    this.email,
    this.phone,
    this.payments,
    this.customer,
    this.customerInn,
    this.clientInfo,
    this.operatingCheckProps,
    this.sectoralCheckProps,
    this.addUserProp,
    this.additionalCheckProps,
  }) : ffdVersion = '1.2';

  /// Преобразование json в модель
  factory Receipt.fromJson(Map<String, dynamic> json) =>
      _$ReceiptFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.taxation: taxation,
        JsonKeys.items: items,
        JsonKeys.ffdVersion: ffdVersion,
        JsonKeys.email: email,
        JsonKeys.phone: phone,
        JsonKeys.payments: payments,
        JsonKeys.customer: customer,
        JsonKeys.customerInn: customerInn,
        JsonKeys.clientInfo: clientInfo,
      };

  @override
  Map<String, dynamic> toJson() => _$ReceiptToJson(this);

  @override
  Receipt copyWith({
    String? email,
    String? phone,
    Taxation? taxation,
    List<Items>? items,
    Payments? payments,
    String? ffdVersion,
    String? customer,
    String? customerInn,
    ClientInfo? clientInfo,
  }) {
    return Receipt.all(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      taxation: taxation ?? this.taxation,
      items: items ?? this.items,
      payments: payments ?? this.payments,
      ffdVersion: ffdVersion ?? this.ffdVersion,
      customer: customer ?? this.customer,
      customerInn: customerInn ?? this.customerInn,
      clientInfo: clientInfo ?? this.clientInfo,
    );
  }

  @override
  void validate() {
    for (int i = 0; i < items.length; i++) {
      items[i].validate();
    }

    payments?.validate();
    clientInfo?.validate();

    assert(email != null || phone != null);
    email.validateEmail(JsonKeys.email);
    phone.validatePhone(JsonKeys.phone);
  }

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

  /// Массив позиций чека с информацией о товарах.
  ///
  /// См. Структура объекта [Items]
  @JsonKey(name: JsonKeys.items)
  final List<Items> items;

  /// Объект с информацией о видах оплаты заказа.
  ///
  /// Если объект не передан, будет автоматически указана итоговая сумма чека с видом оплаты "Безналичный"
  ///
  /// Обязателен для товаров с маркировкой!
  @JsonKey(name: JsonKeys.payments)
  final Payments? payments;

  /// Версия ФФД. Возможные значения:
  /// - 1.2
  /// - 1.05
  @JsonKey(name: JsonKeys.ffdVersion)
  final String ffdVersion;

  /// Идентификатор/Имя покупателя, только для ФФД 1.2
  @JsonKey(name: JsonKeys.customer)
  final String? customer;

  /// ИНН покупателя, только для ФФД 1.2
  @JsonKey(name: JsonKeys.customerInn)
  final String? customerInn;

  /// Информация по покупателю, только для ФФД 1.2
  ///
  /// Обязательный для товаров с маркировкой
  @JsonKey(name: JsonKeys.clientInfo)
  final ClientInfo? clientInfo;

  /// Операционный реквизит чека (тег 1270), только для ФФД 1.2
  @JsonKey(name: JsonKeys.operatingCheckProps)
  final List<OperatingCheckProps>? operatingCheckProps;

  /// Отраслевой реквизит чека (тег 1261), только для ФФД 1.2
  @JsonKey(name: JsonKeys.sectoralCheckProps)
  final List<SectoralCheckProps>? sectoralCheckProps;

  /// Дополнительный реквизит пользователя (тег 1084), только для ФФД 1.2
  @JsonKey(name: JsonKeys.addUserProp)
  final List<AddUserProp>? addUserProp;

  /// Дополнительный реквизит чека (БСО) (тег 1192), только для ФФД 1.2
  @JsonKey(name: JsonKeys.additionalCheckProps)
  final List<String>? additionalCheckProps;
}
