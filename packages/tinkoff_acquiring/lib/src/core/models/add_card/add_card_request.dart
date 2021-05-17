import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
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
    this.description,
    this.payForm,
    this.ip,
    String? signToken,
  }) : super(signToken) {
    validate();
  }

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
        JsonKeys.description: description,
        JsonKeys.payForm: payForm,
        JsonKeys.ip: ip,
      };

  @override
  AddCardRequest copyWith({
    String? customerKey,
    CheckType? checkType,
    String? description,
    String? payForm,
    String? ip,
    String? signToken,
  }) {
    return AddCardRequest(
      customerKey: customerKey ?? this.customerKey,
      checkType: checkType ?? this.checkType,
      description: description ?? this.description,
      payForm: payForm ?? this.payForm,
      ip: ip ?? this.ip,
      signToken: signToken ?? this.signToken,
    );
  }

  @override
  void validate() {
    assert(customerKey.length <= 36);
    final String? _ip = ip;
    if (_ip != null) {
      assert(_ip.length >= 7 && _ip.length <= 45);
    }
    final String? _description = description;
    if (_description != null) {
      assert(_description.length <= 250);
    }
  }

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.customerKey)
  final String customerKey;

  /// Возможные значения:
  /// 1. NO – сохранить карту без проверок. Rebill ID для рекуррентных платежей не возвращается.
  /// 2. HOLD – при сохранении сделать списание и затем отмену на 1 руб.
  /// RebillID для рекуррентных платежей возвращается в ответе.
  /// 3. 3DS – при сохранении карты выполнить проверку 3DS.
  /// Если карта поддерживает 3DS, выполняется списание и последующая отмена на 1 руб.
  /// В этом случае RebillID будет только для 3DS карт. Карты, не поддерживающие 3DS, привязаны не будут.
  /// 4. 3DSHOLD – при привязке карты выполнить проверку поддержки картой 3DS.
  /// Если карта поддерживает 3DS, выполняется списание и последующая отмена на 1 руб.
  /// Если карта не поддерживает 3DS, выполняется списание и последующая отмена на произвольную сумму от 100 до 199 копеек.
  /// Клиент будет перенаправлен на страницу для ввода списанной суммы, где должен корректно указать случайную сумму
  @JsonKey(name: JsonKeys.checkType)
  final CheckType? checkType;

  /// Описание/название карты
  @JsonKey(name: JsonKeys.description)
  final String? description;

  /// Название шаблона формы привязки
  @JsonKey(name: JsonKeys.payForm)
  final String? payForm;

  /// IP-адрес покупателя
  @JsonKey(name: JsonKeys.ip)
  final String? ip;
}
