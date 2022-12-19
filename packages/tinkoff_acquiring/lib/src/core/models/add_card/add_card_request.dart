import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_request.dart';
import '../enums/check_type.dart';

part 'add_card_request.g.dart';

/// Метод инициирует привязку карты к покупателю.
///
/// [AddCardRequest](http://static2.tinkoff.ru/acquiring/manuals/android_sdk.pdf)
@JsonSerializable(includeIfNull: false)
class AddCardRequest extends AcquiringRequest {
  /// Создает экземпляр метода по привязки карты к покупателю
  AddCardRequest({
    required this.customerKey,
    this.checkType,
    this.ip,
    this.residentState,
    String? signToken,
  }) : super(signToken);

  /// Преобразование json в модель
  factory AddCardRequest.fromJson(Map<String, dynamic> json) =>
      _$AddCardRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.addCard;

  @override
  Map<String, dynamic> toJson() => _$AddCardRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.customerKey: customerKey,
        JsonKeys.checkType: checkType,
        JsonKeys.ip: ip,
        JsonKeys.residentState: residentState,
      };

  @override
  AddCardRequest copyWith({
    String? signToken,
    String? customerKey,
    CheckType? checkType,
    String? ip,
    bool? residentState,
  }) {
    return AddCardRequest(
      signToken: signToken ?? this.signToken,
      customerKey: customerKey ?? this.customerKey,
      checkType: checkType ?? this.checkType,
      ip: ip ?? this.ip,
      residentState: residentState ?? this.residentState,
    );
  }

  @override
  void validate() {
    customerKey.validateCustomerKey(JsonKeys.customerKey);
    ip.validateIp(JsonKeys.ip);
  }

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.customerKey)
  final String customerKey;

  /// Есть CheckType не передается, автоматически проставляется значение NO.
  ///
  /// Возможные значения:
  /// 1. NO – сохранить карту без проверок. Rebill ID для рекуррентных платежей не возвращается;
  /// 2. HOLD – при сохранении сделать списание на 0 руб.*
  /// RebillID возвращается для терминалов без поддержки 3DS.
  /// 3. 3DS – при сохранении карты выполнить проверку 3DS и выполнить списание на 0 р.*
  /// В этом случае RebillID будет только для 3DS карт.
  /// Карты, не поддерживающие 3DS, привязаны не будут.
  /// 4. 3DSHOLD – при привязке карты выполняем проверку, поддерживает карта 3DS или нет.
  ///
  /// Для всех карт выполняется списание на 0р.
  @JsonKey(name: JsonKeys.checkType)
  final CheckType? checkType;

  /// IP-адрес покупателя
  @JsonKey(name: JsonKeys.ip)
  final String? ip;

  /// Признак резидентности добавляемой карты.
  ///
  /// Возможные значения:
  /// - true - Карта РФ
  /// - false - Карта не РФ
  /// - null - Не специфицируется (универсальная карта)
  @JsonKey(name: JsonKeys.residentState)
  final bool? residentState;
}
