import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_request.dart';
import '../enums/data_type.dart';

part 'add_account_qr_request.g.dart';

/// Метод инициирует привязку счета покупателя к магазину в СБП и возвращает информацию о нём.
///
/// [AddAccountQrRequest](https://www.tinkoff.ru/kassa/develop/api/payments-sbp/addaccountqr-request/)
@JsonSerializable(includeIfNull: false)
class AddAccountQrRequest extends AcquiringRequest {
  /// Создает экземпляр метода который инициирует привязку счета покупателя к магазину в СБП и возвращает информацию о нём.
  AddAccountQrRequest({
    required this.description,
    this.dataType,
    this.data,
    this.redirectDueDate,
    String? signToken,
  }) : super(signToken);

  /// Преобразование json в модель
  factory AddAccountQrRequest.fromJson(Map<String, dynamic> json) =>
      _$AddAccountQrRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.addAccountQr;

  @override
  Map<String, dynamic> toJson() => _$AddAccountQrRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.description: description,
        JsonKeys.dataType: dataType,
        JsonKeys.data: data,
        JsonKeys.redirectDueDate: redirectDueDate,
      };

  @override
  AddAccountQrRequest copyWith({
    String? signToken,
    String? description,
    DataType? dataType,
    Map<String, String>? data,
    String? redirectDueDate,
  }) {
    return AddAccountQrRequest(
      signToken: signToken ?? this.signToken,
      description: description ?? this.description,
      dataType: dataType ?? this.dataType,
      data: data ?? this.data,
      redirectDueDate: redirectDueDate ?? this.redirectDueDate,
    );
  }

  @override
  void validate() {
    description.validateDescription(JsonKeys.description);
  }

  /// Подробное описание деталей заказа
  @JsonKey(name: JsonKeys.description)
  final String description;

  /// Тип возвращаемых данных
  @JsonKey(name: JsonKeys.dataType, unknownEnumValue: DataType.payload)
  final DataType? dataType;

  /// Дополнительные параметры платежа в формате "ключ":"значение" (не более 20 пар).
  @JsonKey(name: JsonKeys.data)
  final Map<String, String>? data;

  /// Cрок жизни ссылки или динамического QR-кода СБП (если выбран данный способ оплаты).
  /// Если текущая дата превышает дату, переданную в данном параметре,
  /// ссылка для оплаты или возможность платежа по QR-коду становятся недоступными и платёж выполнить нельзя.
  ///
  /// - Максимальное значение: 90 дней от текущей даты.
  /// - Минимальное значение: 1 минута от текущей даты.
  ///
  /// Формат даты: YYYY-MM-DDTHH24:MI:SS+GMT; Пример даты: 2016-08-31T12:28:00+03:00
  @JsonKey(name: JsonKeys.redirectDueDate)
  final String? redirectDueDate;
}
