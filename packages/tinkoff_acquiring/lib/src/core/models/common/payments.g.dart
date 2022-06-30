// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payments _$PaymentsFromJson(Map<String, dynamic> json) => Payments(
      electronic: json['Electronic'] as int,
      cash: json['Cash'] as int?,
      advancePayment: json['AdvancePayment'] as int?,
      credit: json['Credit'] as int?,
      provision: json['Provision'] as int?,
    );

Map<String, dynamic> _$PaymentsToJson(Payments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Cash', instance.cash);
  val['Electronic'] = instance.electronic;
  writeNotNull('AdvancePayment', instance.advancePayment);
  writeNotNull('Credit', instance.credit);
  writeNotNull('Provision', instance.provision);
  return val;
}
