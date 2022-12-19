import 'package:json_annotation/json_annotation.dart';

import '../base/base_request.dart';

part 'operating_check_props.g.dart';

/// Операционный реквизит чека (тег 1270), только для ФФД 1.2
@JsonSerializable(includeIfNull: false)
class OperatingCheckProps extends BaseRequest {
  /// Создает экземпляр данных операционного реквизита чека (тег 1270)
  OperatingCheckProps(
    this.name,
    this.value,
    this.timestamp,
  );

  /// Преобразование json в модель
  factory OperatingCheckProps.fromJson(Map<String, dynamic> json) =>
      _$OperatingCheckPropsFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.name: name,
        JsonKeys.value: value,
        JsonKeys.timestamp: timestamp,
      };

  @override
  Map<String, dynamic> toJson() => _$OperatingCheckPropsToJson(this);

  @override
  OperatingCheckProps copyWith({
    String? name,
    String? value,
    String? timestamp,
  }) {
    return OperatingCheckProps(
      name ?? this.name,
      value ?? this.value,
      timestamp ?? this.timestamp,
    );
  }

  @override
  void validate() {}

  /// Идентификатор операции (тег 1271)
  ///
  /// Принимает значения «0» до определения значения реквизита ФНС России.
  @JsonKey(name: JsonKeys.name)
  final String name;

  /// Данные операции (тег 1272)
  @JsonKey(name: JsonKeys.value)
  final String value;

  /// Дата и время операции в формате ДД.ММ.ГГГГ ЧЧ:ММ:СС (тег 1273)
  @JsonKey(name: JsonKeys.timestamp)
  final String timestamp;
}
