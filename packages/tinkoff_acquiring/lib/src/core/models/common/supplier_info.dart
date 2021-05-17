import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/base_request.dart';

part 'supplier_info.g.dart';

/// Данные поставщика платежного агента
///
/// [AgentData](https://oplata.tinkoff.ru/develop/api/payments/init-request/#SupplierInfo)
@JsonSerializable(includeIfNull: false)
class SupplierInfo extends BaseRequest {
  /// Создает экземпляр данных поставщика платежного агента
  SupplierInfo(
    this.phones,
    this.name,
    this.inn,
  );

  /// Преобразование json в модель
  factory SupplierInfo.fromJson(Map<String, dynamic> json) =>
      _$SupplierInfoFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.phones: phones,
        JsonKeys.name: name,
        JsonKeys.inn: inn,
      };

  @override
  Map<String, dynamic> toJson() => _$SupplierInfoToJson(this);

  @override
  SupplierInfo copyWith({
    List<String>? phones,
    String? name,
    String? inn,
  }) {
    return SupplierInfo(
      phones ?? this.phones,
      name ?? this.name,
      inn ?? this.inn,
    );
  }

  @override
  void validate() {
    assert(phones.isNotEmpty && phones.length <= 19);
    assert(name.length <= 239);
    assert(inn.length >= 10);
    assert(inn.length <= 12);
  }

  /// Телефон поставщика
  ///
  /// Массив строк длиной от 1 до 19 символов, формат +{Ц}
  ///
  /// Пример: [`+71234567890`, `+79876543211`]
  @JsonKey(name: JsonKeys.phones)
  final List<String> phones;

  /// Наименование поставщика
  ///
  /// Внимание: в данные 239 символов включаются телефоны поставщика + 4 символа на каждый телефон.
  ///
  /// Например, если передано два телефона поставщика длиной 12 и 14 символов,
  /// то максимальная длина наименования поставщика будет 239 – (12 + 4) – (14 + 4) = 205 символов
  @JsonKey(name: JsonKeys.name)
  final String name;

  /// ИНН поставщика
  ///
  /// Строка длиной от 10 до 12 символов, формат ЦЦЦЦЦЦЦЦЦЦ
  @JsonKey(name: JsonKeys.inn)
  final String inn;
}
