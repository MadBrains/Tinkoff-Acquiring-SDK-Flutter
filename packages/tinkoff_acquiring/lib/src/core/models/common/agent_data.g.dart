// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentData _$AgentDataFromJson(Map<String, dynamic> json) => AgentData(
      agentSign: $enumDecodeNullable(_$AgentSignEnumMap, json['AgentSign']),
      operationName: json['OperationName'] as String?,
      phones:
          (json['Phones'] as List<dynamic>?)?.map((e) => e as String).toList(),
      receiverPhones: (json['ReceiverPhones'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      transferPhones: (json['TransferPhones'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      operatorName: json['OperatorName'] as String?,
      operatorAddress: json['OperatorAddress'] as String?,
      operatorInn: json['OperatorInn'] as String?,
    );

Map<String, dynamic> _$AgentDataToJson(AgentData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AgentSign', _$AgentSignEnumMap[instance.agentSign]);
  writeNotNull('OperationName', instance.operationName);
  writeNotNull('Phones', instance.phones);
  writeNotNull('ReceiverPhones', instance.receiverPhones);
  writeNotNull('TransferPhones', instance.transferPhones);
  writeNotNull('OperatorName', instance.operatorName);
  writeNotNull('OperatorAddress', instance.operatorAddress);
  writeNotNull('OperatorInn', instance.operatorInn);
  return val;
}

const _$AgentSignEnumMap = {
  AgentSign.bankPayingAgent: 'bank_paying_agent',
  AgentSign.bankPayingSubagent: 'bank_paying_subagent',
  AgentSign.payingAgent: 'paying_agent',
  AgentSign.payingSubagent: 'paying_subagent',
  AgentSign.attorney: 'attorney',
  AgentSign.commissionAgent: 'commission_agent',
  AgentSign.another: 'another',
};
