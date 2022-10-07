import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_request.dart';

part 'get_account_qr_list_request.g.dart';

/// Возвращает список привязанных счетов покупателя по магазину
///
/// [GetAccountQrListRequest](https://www.tinkoff.ru/kassa/develop/api/payments-sbp/getaccountqrlist-request/)
@JsonSerializable(includeIfNull: false)
class GetAccountQrListRequest extends AcquiringRequest {
  /// Создает экземпляр метода по получению списока привязанных счетов покупателя по магазину
  GetAccountQrListRequest({
    String? signToken,
  }) : super(signToken);

  /// Преобразование json в модель
  factory GetAccountQrListRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAccountQrListRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.getAccountQrList;

  @override
  Map<String, dynamic> toJson() => _$GetAccountQrListRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
      };

  @override
  GetAccountQrListRequest copyWith({
    String? signToken,
  }) {
    return GetAccountQrListRequest(
      signToken: signToken ?? this.signToken,
    );
  }

  @override
  void validate() {}
}
