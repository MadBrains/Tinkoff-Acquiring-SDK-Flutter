import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_response.dart';

part 'get_static_qr_response.g.dart';

/// Ответ от сервера на регистрацию статического QR
///
/// [GetStaticQrResponse](https://oplata.tinkoff.ru/develop/api/autopayments/getstaticqr-response/)
@JsonSerializable()
class GetStaticQrResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на регистрацию статического QR
  GetStaticQrResponse({
    bool? success,
    String? errorCode,
    String? message,
    String? details,
    this.terminalKey,
    this.data,
  }) : super(
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory GetStaticQrResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStaticQrResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetStaticQrResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.terminalKey: terminalKey,
        JsonKeys.data2: data,
      };

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  @JsonKey(name: JsonKeys.terminalKey)
  final String? terminalKey;

  /// В зависимости от `DataType` в запросе это: `Payload` - информация,
  /// которая должна быть закодирована в `QR`
  /// или `SVG` изображение `QR` в котором уже закодирован `Payload`
  @JsonKey(name: JsonKeys.data2)
  final String? data;
}
