import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_response.dart';
import '../enums/status.dart';

part 'send_closing_receipt_response.g.dart';

/// Ответ от сервера на закрывающий чек в кассу
///
/// [SendClosingReceiptResponse](https://www.tinkoff.ru/kassa/develop/api/payments/SendClosingReceipt-response/)
@JsonSerializable()
class SendClosingReceiptResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на закрывающий чек в кассу
  SendClosingReceiptResponse({
    Status? status,
    bool? success,
    String? errorCode,
    String? message,
    String? details,
  }) : super(
          status: status,
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory SendClosingReceiptResponse.fromJson(Map<String, dynamic> json) =>
      _$SendClosingReceiptResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SendClosingReceiptResponseToJson(this);
}
