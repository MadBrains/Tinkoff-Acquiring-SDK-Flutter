import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';

part 'attach_card_request.g.dart';

/// Метод завершает привязку карты к покупателю.
/// Метод дложен вызывается после метода AddCard.
///
/// [AttachCardRequest](http://static2.tinkoff.ru/acquiring/manuals/android_sdk.pdf)
@JsonSerializable(includeIfNull: false)
class AttachCardRequest extends AcquiringRequest {
  /// Создает экземпляр метода по привязки карты к покупателю
  AttachCardRequest({
    required this.requestKey,
    required this.cardData,
    this.data,
    String? signToken,
  }) : super(signToken) {
    validate();
  }

  /// Преобразование json в модель
  factory AttachCardRequest.fromJson(Map<String, dynamic> json) =>
      _$AttachCardRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.attachCard;

  @override
  Map<String, dynamic> toJson() => _$AttachCardRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.requestKey: requestKey,
        JsonKeys.cardData: cardData,
        JsonKeys.data: data,
      };

  @override
  AttachCardRequest copyWith({
    String? requestKey,
    String? cardData,
    Map<String, String>? data,
    String? signToken,
  }) {
    return AttachCardRequest(
      requestKey: requestKey ?? this.requestKey,
      cardData: cardData ?? this.cardData,
      data: data ?? this.data,
      signToken: signToken ?? this.signToken,
    );
  }

  @override
  void validate() {}

  /// Идентификатор запроса на привязку карты
  @JsonKey(name: JsonKeys.requestKey)
  final String requestKey;

  /// Зашифрованные данные карты. См. класс [CardData].
  @JsonKey(name: JsonKeys.cardData)
  final String cardData;

  /// Дополнительные параметры платежа в формате "ключ":"значение" (не более 20 пар).
  ///
  /// Наименование самого параметра должно быть в верхнем регистре, иначе его содержимое будет игнорироваться.
  ///
  /// 1. Если у терминала включена опция привязки покупателя после успешной оплаты и передается параметр CustomerKey, то в передаваемых параметрах DATA могут присутствовать параметры метода AddCustomer. Если они присутствуют, то автоматически привязываются к покупателю.
  /// Например, если указать: "DATA":{"Phone":"+71234567890", "Email":"a@test.com"}, к покупателю автоматически будут привязаны данные Email и телефон, и они будут возвращаться при вызове метода GetCustomer.
  ///
  /// 2. Если используется функционал сохранения карт на платежной форме, то при помощи опционального параметра "DefaultCard" можно задать какая карта будет выбираться по умолчанию. Возможные варианты:
  /// Оставить платежную форму пустой. Пример: "DATA":{"DefaultCard":"none"};
  /// Заполнить данными передаваемой карты. В этом случае передается CardId. Пример: "DATA":{"DefaultCard":"894952"};
  /// Заполнить данными последней сохраненной карты. Применяется, если параметр "DefaultCard" не передан, передан с некорректным значением или в значении null.
  /// По умолчанию возможность сохранения карт на платежной форме может быть отключена. Для активации обратитесь в службу технической поддержки.
  @JsonKey(name: JsonKeys.data)
  final Map<String, String>? data;
}
