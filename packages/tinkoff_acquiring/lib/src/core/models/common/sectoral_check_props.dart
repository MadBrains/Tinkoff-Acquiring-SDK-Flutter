import 'package:json_annotation/json_annotation.dart';

import '../base/base_request.dart';

part 'sectoral_check_props.g.dart';

/// Данные поставщика платежного агента
///
/// [AgentData](https://www.tinkoff.ru/kassa/develop/api/payments/init-request/#SectoralCheckProps)
@JsonSerializable(includeIfNull: false)
class SectoralCheckProps extends BaseRequest {
  /// Создает экземпляр данных поставщика платежного агента
  SectoralCheckProps(
    this.federalId,
    this.date,
    this.number,
    this.value,
  );

  /// Преобразование json в модель
  factory SectoralCheckProps.fromJson(Map<String, dynamic> json) =>
      _$SectoralCheckPropsFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.federalId: federalId,
        JsonKeys.date: date,
        JsonKeys.number: number,
        JsonKeys.value: value,
      };

  @override
  Map<String, dynamic> toJson() => _$SectoralCheckPropsToJson(this);

  @override
  SectoralCheckProps copyWith({
    String? federalId,
    String? date,
    String? number,
    String? value,
  }) {
    return SectoralCheckProps(
      federalId ?? this.federalId,
      date ?? this.date,
      number ?? this.number,
      value ?? this.value,
    );
  }

  @override
  void validate() {}

  /// Идентификатор ФОИВ (тег 1262). Максимальное количество символов – 3
  @JsonKey(name: JsonKeys.federalId)
  final String federalId;

  /// Дата документа основания в формате ДД.ММ.ГГГГ (тег 1263)
  @JsonKey(name: JsonKeys.date)
  final String date;

  /// Номер документа основания (тег 1264)
  @JsonKey(name: JsonKeys.number)
  final String number;

  /// Значение отраслевого реквизита (тег 1265)
  @JsonKey(name: JsonKeys.value)
  final String value;
}
