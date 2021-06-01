import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';
import '../enums/data_type.dart';

part 'get_static_qr_request.g.dart';

/// Метод регистрирует статический QR и возвращает информацию о нем.
///
/// При первом вызове регистрирует QR и возвращает информацию о нем при последующих вызовах вовзращает информацию о ранее сгенерированном QR.
/// Перерегистрация статического QR происходит только при смене расчетного счета.
/// Не привязан к конкретному платежу, может быть вызван в любое время без предварительного вызова Init.
///
/// [GetStaticQrRequest](https://oplata.tinkoff.ru/develop/api/autopayments/getstaticqr-request/)
@JsonSerializable(includeIfNull: false)
class GetStaticQrRequest extends AcquiringRequest {
  /// Создает экземпляр метода регистрации статического QR
  GetStaticQrRequest({
    this.dataType,
    String? signToken,
  }) : super(signToken) {
    validate();
  }

  /// Преобразование json в модель
  factory GetStaticQrRequest.fromJson(Map<String, dynamic> json) =>
      _$GetStaticQrRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.getStaticQr;

  @override
  Map<String, dynamic> toJson() => _$GetStaticQrRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.dataType: dataType,
      };

  @override
  GetStaticQrRequest copyWith({
    DataType? dataType,
    String? signToken,
  }) {
    return GetStaticQrRequest(
      dataType: dataType ?? this.dataType,
      signToken: signToken ?? this.signToken,
    );
  }

  @override
  void validate() {}

  /// Тип возвращаемых данных
  @JsonKey(name: JsonKeys.dataType, defaultValue: DataType.payload)
  final DataType? dataType;
}
