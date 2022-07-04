import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_request.dart';

part 'qr_members_list_request.g.dart';

/// Метод возвращает cписок участников куда может быть осуществлен возврат платежа, совершенного по QR.
///
/// [QrMembersListRequest](https://www.tinkoff.ru/kassa/develop/api/payments-sbp/qrmemberslist-description/)
@JsonSerializable(includeIfNull: false)
class QrMembersListRequest extends AcquiringRequest {
  /// Создает экземпляр метода по получению cписока участников куда может быть осуществлен возврат платежа, совершенного по QR.
  QrMembersListRequest({
    required this.paymentId,
    String? signToken,
  }) : super(signToken);

  /// Преобразование json в модель
  factory QrMembersListRequest.fromJson(Map<String, dynamic> json) =>
      _$QrMembersListRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.qrMembersList;

  @override
  Map<String, dynamic> toJson() => _$QrMembersListRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.paymentId: paymentId,
      };

  @override
  QrMembersListRequest copyWith({
    int? paymentId,
    String? signToken,
  }) {
    return QrMembersListRequest(
      paymentId: paymentId ?? this.paymentId,
      signToken: signToken ?? this.signToken,
    );
  }

  @override
  void validate() {
    paymentId.validateId(JsonKeys.paymentId);
  }

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.paymentId)
  final int paymentId;
}
