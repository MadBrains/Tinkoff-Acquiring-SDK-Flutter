import 'package:json_annotation/json_annotation.dart';

import '../base/base_request.dart';

part 'add_user_prop.g.dart';

/// Данные поставщика платежного агента
///
/// [AgentData](https://www.tinkoff.ru/kassa/develop/api/payments/init-request/#AddUserProp)
@JsonSerializable(includeIfNull: false)
class AddUserProp extends BaseRequest {
  /// Создает экземпляр данных поставщика платежного агента
  AddUserProp(
    this.name,
    this.value,
  );

  /// Преобразование json в модель
  factory AddUserProp.fromJson(Map<String, dynamic> json) =>
      _$AddUserPropFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.name: name,
        JsonKeys.value: value,
      };

  @override
  Map<String, dynamic> toJson() => _$AddUserPropToJson(this);

  @override
  AddUserProp copyWith({
    String? name,
    String? value,
  }) {
    return AddUserProp(
      name ?? this.name,
      value ?? this.value,
    );
  }

  @override
  void validate() {}

  /// Наименование дополнительного реквизита пользователя (тег 1085)
  @JsonKey(name: JsonKeys.name)
  final String name;

  /// Значение дополнительного реквизита пользователя (тег1086)
  @JsonKey(name: JsonKeys.value)
  final String value;
}
