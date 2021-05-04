import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../../models/base/acquiring_response.dart';
import '../../models/enums/status.dart';

part 'check_3ds_version_response.g.dart';

/// Ответ от сервера по проверки 3DS протокола
///
/// [Check3DSVersionResponse](https://oplata.tinkoff.ru/develop/api/payments/check_3ds_version-response/)
@JsonSerializable()
class Check3DSVersionResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера по проверки 3DS протокола
  Check3DSVersionResponse({
    Status? status,
    bool? success,
    String? errorCode,
    String? message,
    String? details,
    this.version,
    this.serverTransId,
    this.threeDsMethodUrl,
  }) : super(
          status: status,
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory Check3DSVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$Check3DSVersionResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$Check3DSVersionResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.version: version,
        JsonKeys.tdsServerTransID: serverTransId,
        JsonKeys.threeDsMethodUrl: threeDsMethodUrl,
      };

  /// Определение версии 3DS протокола
  bool get is3DsVersion2 => serverTransId?.isNotEmpty == true;

  /// Версия протокола 3DS
  @JsonKey(name: JsonKeys.version)
  final String? version;

  /// Уникальный идентификатор транзакции, генерируемый 3DS-Server,
  /// обязательный параметр для 3DS второй версии
  @JsonKey(name: JsonKeys.tdsServerTransID)
  final String? serverTransId;

  /// Дополнительный параметр для 3DS второй версии,
  /// который позволяет пройти этап по сбору данных браузера ACS-ом
  @JsonKey(name: JsonKeys.threeDsMethodUrl)
  final String? threeDsMethodUrl;
}
