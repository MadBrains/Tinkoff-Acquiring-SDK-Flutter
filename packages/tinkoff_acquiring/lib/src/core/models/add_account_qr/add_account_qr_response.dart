import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_response.dart';
import '../enums/data_type.dart';
import '../enums/status.dart';

part 'add_account_qr_response.g.dart';

/// Ответ от сервера на инициацию привязки счета покупателя к магазину в СБП и возвращает информацию о нём.
///
/// [AddAccountQrResponse](https://www.tinkoff.ru/kassa/develop/api/payments-sbp/addaccountqr-response/)
@JsonSerializable()
class AddAccountQrResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от инициацию привязки счета покупателя к магазину в СБП и возвращает информацию о нём.
  AddAccountQrResponse({
    Status? status,
    bool? success,
    String? errorCode,
    String? message,
    String? details,
    this.terminalKey,
    this.dataType,
    this.requestKey,
  }) : super(
          status: status,
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory AddAccountQrResponse.fromJson(Map<String, dynamic> json) =>
      _$AddAccountQrResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AddAccountQrResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.terminalKey: terminalKey,
        JsonKeys.dataType: dataType,
        JsonKeys.requestKey: requestKey,
      };

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  @JsonKey(name: JsonKeys.terminalKey)
  final String? terminalKey;

  /// Тип возвращаемых данных
  @JsonKey(name: JsonKeys.data2, unknownEnumValue: DataType.notExist)
  final DataType? dataType;

  /// Идентификатор запроса на привязку счета
  @JsonKey(name: JsonKeys.requestKey)
  final String? requestKey;
}
