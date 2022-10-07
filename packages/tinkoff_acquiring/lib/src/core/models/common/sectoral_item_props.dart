import 'package:json_annotation/json_annotation.dart';

import '../base/base_request.dart';

part 'sectoral_item_props.g.dart';

/// Отраслевой реквизит предмета расчета.
/// Необходимо указывать только для товаров подлежащих обязательной маркировке средством идентификации
/// и включение данного реквизита предусмотрено НПА отраслевого регулирования для соответствующей товарной группы.
///
/// [SectoralItemProps](https://www.tinkoff.ru/kassa/develop/api/receipt/ffd12#SectoralItemProps)
@JsonSerializable(includeIfNull: false)
class SectoralItemProps extends BaseRequest {
  /// Создает экземпляр данных отраслевого реквизита предмета расчета.
  SectoralItemProps({
    required this.federalId,
    required this.date,
    required this.number,
    required this.value,
  });

  /// Преобразование json в модель
  factory SectoralItemProps.fromJson(Map<String, dynamic> json) =>
      _$SectoralItemPropsFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.federalId: federalId,
        JsonKeys.date: date,
        JsonKeys.number: number,
        JsonKeys.value: value,
      };

  @override
  Map<String, dynamic> toJson() => _$SectoralItemPropsToJson(this);

  @override
  SectoralItemProps copyWith({
    String? federalId,
    String? date,
    String? number,
    String? value,
  }) {
    return SectoralItemProps(
      federalId: federalId ?? this.federalId,
      date: date ?? this.date,
      number: number ?? this.number,
      value: value ?? this.value,
    );
  }

  @override
  void validate() {}

  /// Идентификатор ФОИВ (федеральный орган исполнительной власти).
  @JsonKey(name: JsonKeys.federalId)
  final String federalId;

  /// Дата нормативного акта ФОИВ
  @JsonKey(name: JsonKeys.date)
  final String date;

  /// Номер нормативного акта ФОИВ
  @JsonKey(name: JsonKeys.number)
  final String number;

  /// Состав значений, определенных нормативного актом ФОИВ.
  @JsonKey(name: JsonKeys.value)
  final String value;
}
