import 'package:json_annotation/json_annotation.dart';

import '../../constants.dart';
import '../enums/agent_sign.dart';

part 'agent_data.g.dart';

/// Данные агента
///
/// [AgentData](https://oplata.tinkoff.ru/develop/api/payments/init-request/#AgentData)
@JsonSerializable(includeIfNull: false)
class AgentData {
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

  /// Преобразование модели в json
  Map<String, dynamic> toJson() => _$AgentDataToJson(this);

  /// Метод проверяет валидность данных
  void validate() {
    if (agentSign == AgentSign.bankPayingAgent ||
        agentSign == AgentSign.bankPayingSubagent) {
      assert(operationName != null);
      assert(operationName.length <= 64);
    }
    if (agentSign == AgentSign.bankPayingAgent ||
        agentSign == AgentSign.bankPayingSubagent ||
        agentSign == AgentSign.payingAgent ||
        agentSign == AgentSign.payingSubagent) {
      assert(phones != null);
      assert(phones.isNotEmpty && phones.length <= 19);
    }
    if (agentSign == AgentSign.payingAgent ||
        agentSign == AgentSign.payingSubagent) {
      assert(receiverPhones != null);
      assert(receiverPhones.isNotEmpty && receiverPhones.length <= 19);
    }
    if (agentSign == AgentSign.bankPayingAgent ||
        agentSign == AgentSign.bankPayingSubagent) {
      assert(transferPhones != null);
      assert(transferPhones.isNotEmpty && transferPhones.length <= 19);
    }
    if (agentSign == AgentSign.bankPayingAgent ||
        agentSign == AgentSign.bankPayingSubagent) {
      assert(operatorName != null);
      assert(operatorName.length <= 64);
    }
    if (agentSign == AgentSign.bankPayingAgent ||
        agentSign == AgentSign.bankPayingSubagent) {
      assert(operatorAddress != null);
      assert(operatorAddress.length <= 243);
    }
    if (agentSign == AgentSign.bankPayingAgent ||
        agentSign == AgentSign.bankPayingSubagent) {
      assert(operatorInn != null);
      assert(operatorInn.length >= 10);
      assert(operatorInn.length <= 12);
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
  final AgentSign agentSign;

  /// Наименование операции
  @JsonKey(name: JsonKeys.operationName)
  final String operationName;

  /// Телефоны платежного агента
  ///
  /// Массив строк длиной от 1 до 19 символов, формат +{Ц}
  ///
  /// Пример: [`+71234567890`]
  @JsonKey(name: JsonKeys.phones)
  final List<String> phones;

  /// Телефоны оператора по приему платежей
  ///
  /// Массив строк длиной от 1 до 19 символов, формат +{Ц}
  ///
  /// Пример: [`+71234567890`, `+79876543211`]
  @JsonKey(name: JsonKeys.receiverPhones)
  final List<String> receiverPhones;

  /// Телефоны оператора перевода
  ///
  /// Массив строк длиной от 1 до 19 символов, формат +{Ц}
  ///
  /// Пример: [`+71234567890`, `+79876543211`, `+79998886655`]
  @JsonKey(name: JsonKeys.transferPhones)
  final List<String> transferPhones;

  /// Наименование оператора перевода
  @JsonKey(name: JsonKeys.operatorName)
  final String operatorName;

  /// Адрес оператора перевода
  @JsonKey(name: JsonKeys.operatorAddress)
  final String operatorAddress;

  /// ИНН оператора перевода
  @JsonKey(name: JsonKeys.operatorInn)
  final String operatorInn;
}
