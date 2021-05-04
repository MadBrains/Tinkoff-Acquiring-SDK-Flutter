import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/base_request.dart';
import '../enums/agent_sign.dart';

part 'agent_data.g.dart';

/// Данные агента
///
/// [AgentData](https://oplata.tinkoff.ru/develop/api/payments/init-request/#AgentData)
@JsonSerializable(includeIfNull: false)
class AgentData extends BaseRequest {
  /// Создает экземпляр данных агента
  AgentData({
    this.agentSign,
    this.operationName,
    this.phones,
    this.receiverPhones,
    this.transferPhones,
    this.operatorName,
    this.operatorAddress,
    this.operatorInn,
  });

  /// Преобразование json в модель
  factory AgentData.fromJson(Map<String, dynamic> json) =>
      _$AgentDataFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.agentSign: agentSign,
        JsonKeys.operationName: operationName,
        JsonKeys.phones: phones,
        JsonKeys.receiverPhones: receiverPhones,
        JsonKeys.transferPhones: transferPhones,
        JsonKeys.operatorName: operatorName,
        JsonKeys.operatorAddress: operatorAddress,
        JsonKeys.operatorInn: operatorInn,
      };

  @override
  Map<String, dynamic> toJson() => _$AgentDataToJson(this);

  @override
  AgentData copyWith({
    AgentSign? agentSign,
    String? operationName,
    List<String>? phones,
    List<String>? receiverPhones,
    List<String>? transferPhones,
    String? operatorName,
    String? operatorAddress,
    String? operatorInn,
  }) {
    return AgentData(
      agentSign: agentSign ?? this.agentSign,
      operationName: operationName ?? this.operationName,
      phones: phones ?? this.phones,
      receiverPhones: receiverPhones ?? this.receiverPhones,
      transferPhones: transferPhones ?? this.transferPhones,
      operatorName: operatorName ?? this.operatorName,
      operatorAddress: operatorAddress ?? this.operatorAddress,
      operatorInn: operatorInn ?? this.operatorInn,
    );
  }

  @override
  void validate() {
    final String? _operationName = operationName;
    if (agentSign == AgentSign.bankPayingAgent ||
        agentSign == AgentSign.bankPayingSubagent) {
      assert(_operationName != null && _operationName.length <= 64);
    }

    final List<String>? _phones = phones;
    if (agentSign == AgentSign.bankPayingAgent ||
        agentSign == AgentSign.bankPayingSubagent ||
        agentSign == AgentSign.payingAgent ||
        agentSign == AgentSign.payingSubagent) {
      assert(_phones != null && _phones.isNotEmpty && _phones.length <= 19);
    }

    final List<String>? _receiverPhones = receiverPhones;
    if (agentSign == AgentSign.payingAgent ||
        agentSign == AgentSign.payingSubagent) {
      assert(_receiverPhones != null &&
          _receiverPhones.isNotEmpty &&
          _receiverPhones.length <= 19);
    }

    final List<String>? _transferPhones = transferPhones;
    if (agentSign == AgentSign.bankPayingAgent ||
        agentSign == AgentSign.bankPayingSubagent) {
      assert(_transferPhones != null &&
          _transferPhones.isNotEmpty &&
          _transferPhones.length <= 19);
    }

    final String? _operatorName = operatorName;
    if (agentSign == AgentSign.bankPayingAgent ||
        agentSign == AgentSign.bankPayingSubagent) {
      assert(_operatorName != null && _operatorName.length <= 64);
    }

    final String? _operatorAddress = operatorAddress;
    if (agentSign == AgentSign.bankPayingAgent ||
        agentSign == AgentSign.bankPayingSubagent) {
      assert(_operatorAddress != null && _operatorAddress.length <= 243);
    }

    final String? _operatorInn = operatorInn;
    if (agentSign == AgentSign.bankPayingAgent ||
        agentSign == AgentSign.bankPayingSubagent) {
      assert(_operatorInn != null &&
          _operatorInn.length >= 10 &&
          _operatorInn.length <= 12);
    }
  }

  /// Признак агента. Возможные значения:
  /// 1. bank_paying_agent – банковский платежный агент
  /// 2. bank_paying_subagent – банковский платежный субагент
  /// 3. paying_agent – платежный агент
  /// 4. paying_subagent – платежный субагент
  /// 5. attorney – поверенный
  /// 6. commission_agent – комиссионер
  /// 7. another – другой тип агента
  @JsonKey(name: JsonKeys.agentSign)
  final AgentSign? agentSign;

  /// Наименование операции
  @JsonKey(name: JsonKeys.operationName)
  final String? operationName;

  /// Телефоны платежного агента
  ///
  /// Массив строк длиной от 1 до 19 символов, формат +{Ц}
  ///
  /// Пример: [`+71234567890`]
  @JsonKey(name: JsonKeys.phones)
  final List<String>? phones;

  /// Телефоны оператора по приему платежей
  ///
  /// Массив строк длиной от 1 до 19 символов, формат +{Ц}
  ///
  /// Пример: [`+71234567890`, `+79876543211`]
  @JsonKey(name: JsonKeys.receiverPhones)
  final List<String>? receiverPhones;

  /// Телефоны оператора перевода
  ///
  /// Массив строк длиной от 1 до 19 символов, формат +{Ц}
  ///
  /// Пример: [`+71234567890`, `+79876543211`, `+79998886655`]
  @JsonKey(name: JsonKeys.transferPhones)
  final List<String>? transferPhones;

  /// Наименование оператора перевода
  @JsonKey(name: JsonKeys.operatorName)
  final String? operatorName;

  /// Адрес оператора перевода
  @JsonKey(name: JsonKeys.operatorAddress)
  final String? operatorAddress;

  /// ИНН оператора перевода
  @JsonKey(name: JsonKeys.operatorInn)
  final String? operatorInn;
}
