import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../../../utils/extensions.dart';
import '../base/acquiring_request.dart';
import '../enums/data_type.dart';

part 'get_qr_request.g.dart';

/// Метод регистрирует QR и возвращает информацию о нем. Должен быть вызван после метода `Init`
///
/// [GetQrRequest](https://oplata.tinkoff.ru/develop/api/autopayments/getqr-request/)
@JsonSerializable(includeIfNull: false)
class GetQrRequest extends AcquiringRequest {
  /// Создает экземпляр метода регистрации QR
  GetQrRequest({
    required this.paymentId,
    this.dataType,
    String? signToken,
  }) : super(signToken) {
    validate();
  }

  /// Преобразование json в модель
  factory GetQrRequest.fromJson(Map<String, dynamic> json) =>
      _$GetQrRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.getQr;

  @override
  Map<String, dynamic> toJson() => _$GetQrRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.paymentId: paymentId,
        JsonKeys.dataType: dataType,
      };

  @override
  GetQrRequest copyWith({
    int? paymentId,
    DataType? dataType,
    String? signToken,
  }) {
    return GetQrRequest(
      paymentId: paymentId ?? this.paymentId,
      dataType: dataType ?? this.dataType,
      signToken: signToken ?? this.signToken,
    );
  }

  @override
  void validate() {
    assert(paymentId.length <= 20);
  }

  /// Уникальный идентификатор транзакции в системе Банка, полученный в ответе на вызов метода `Init`
  @JsonKey(name: JsonKeys.paymentId)
  final int paymentId;

  /// Тип возвращаемых данных
  @JsonKey(name: JsonKeys.dataType, defaultValue: DataType.payload)
  final DataType? dataType;
}
