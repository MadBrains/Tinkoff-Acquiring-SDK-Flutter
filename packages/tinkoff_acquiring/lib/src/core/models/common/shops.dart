import 'package:json_annotation/json_annotation.dart';

import '../base/base_request.dart';

part 'shops.g.dart';

/// Данными Маркетплейса
///
/// [Shops](https://www.tinkoff.ru/kassa/develop/api/payments/init-request/#Shops)
@JsonSerializable(includeIfNull: false)
class Shops extends BaseRequest {
  /// Создает экземпляр данных Маркетплейса
  Shops({
    required this.shopCode,
    required this.amount,
    this.name,
    this.fee,
  });

  /// Преобразование json в модель
  factory Shops.fromJson(Map<String, dynamic> json) => _$ShopsFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.shopCode: shopCode,
        JsonKeys.amount: amount,
        JsonKeys.name: name,
        JsonKeys.fee: fee,
      };

  @override
  Map<String, dynamic> toJson() => _$ShopsToJson(this);

  @override
  Shops copyWith({
    String? shopCode,
    int? amount,
    String? name,
    String? fee,
  }) {
    return Shops(
      shopCode: shopCode ?? this.shopCode,
      amount: amount ?? this.amount,
      name: name ?? this.name,
      fee: fee ?? this.fee,
    );
  }

  @override
  void validate() {
    amount.validateAmount(JsonKeys.amount);
  }

  /// Код магазина
  @JsonKey(name: JsonKeys.shopCode)
  final String shopCode;

  /// Cумма в копейках, которая относится к указанному [shopCode]
  @JsonKey(name: JsonKeys.amount)
  final int amount;

  /// Наименование позиции
  @JsonKey(name: JsonKeys.name)
  final String? name;

  /// Сумма комиссии в копейках, удерживаемая из возмещения Партнера в пользу Маркетплейса.
  /// Если не передано, используется комиссия, указанная при регистрации.
  @JsonKey(name: JsonKeys.fee)
  final String? fee;
}
