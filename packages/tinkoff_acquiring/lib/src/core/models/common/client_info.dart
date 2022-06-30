import 'package:json_annotation/json_annotation.dart';

import '../base/base_request.dart';

part 'client_info.g.dart';

/// Информация по покупателю
///
/// [ClientInfo](https://www.tinkoff.ru/kassa/develop/api/receipt/ffd12/#ClientInfo)
@JsonSerializable(includeIfNull: false)
class ClientInfo extends BaseRequest {
  /// Создает экземпляр данных с информацией по покупателю
  ClientInfo({
    this.birthdate,
    this.citizenship,
    this.documentCode,
    this.documentData,
    this.address,
  });

  /// Преобразование json в модель
  factory ClientInfo.fromJson(Map<String, dynamic> json) =>
      _$ClientInfoFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.birthdate: birthdate,
        JsonKeys.citizenship: citizenship,
        JsonKeys.documentCode: documentCode,
        JsonKeys.documentData: documentData,
        JsonKeys.address: address,
      };

  @override
  Map<String, dynamic> toJson() => _$ClientInfoToJson(this);

  @override
  ClientInfo copyWith({
    String? birthdate,
    String? citizenship,
    String? documentCode,
    String? documentData,
    String? address,
  }) {
    return ClientInfo(
      birthdate: birthdate ?? this.birthdate,
      citizenship: citizenship ?? this.citizenship,
      documentCode: documentCode ?? this.documentCode,
      documentData: documentData ?? this.documentData,
      address: address ?? this.address,
    );
  }

  @override
  void validate() {}

  /// Дата рождения покупателя в формате ДД.ММ.ГГГГ
  @JsonKey(name: JsonKeys.birthdate)
  final String? birthdate;

  /// Числовой код страны, гражданином которой является покупатель.
  /// Код страны указывается в соответствии с Общероссийским классификатором стран мира ОКСМ
  @JsonKey(name: JsonKeys.citizenship)
  final String? citizenship;

  /// Числовой код вида документа, удостоверяющего личность.
  ///
  /// Может принимать только значения:
  /// - 21 - Паспорт гражданина Российской Федерации
  ///
  /// - 22 - Паспорт гражданина Российской Федерации, дипломатический паспорт,
  /// служебный паспорт, удостоверяющие личность гражданина Российской Федерации за пределами Российской Федерации;
  ///
  /// - 26 - Временное удостоверение личности гражданина Российской Федерации,
  /// выдаваемое на период оформления паспорта гражданина Российской Федерации
  ///
  /// - 27 - Свидетельство о рождении гражданина Российской Федерации
  /// (для граждан Российской Федерации в возрасте до 14 лет)
  ///
  /// - 28 - Иные документы, признаваемые документами, удостоверяющими личность гражданина Российской Федерации
  /// в соответствии с законодательством Российской Федерации
  ///
  /// - 31 - Паспорт иностранного гражданина
  ///
  /// - 32 - Иные документы, признаваемые документами, удостоверяющими личность иностранного гражданина
  /// в соответствии с законодательством Российской Федерации и международным договором Российской Федерации
  ///
  /// - 33 - Документ, выданный иностранным государством и признаваемый в соответствии
  /// с международным договором Российской Федерации в качестве документа, удостоверяющего личность лица без гражданства.
  ///
  /// - 34 - Вид на жительство (для лиц без гражданства)
  ///
  /// - 35 - Разрешение на временное проживание (для лиц без гражданства)
  ///
  /// - 36 - Свидетельство о рассмотрении ходатайства о признании лица
  /// без гражданства беженцем на территории Российской Федерации по существу
  ///
  /// - 37 - Удостоверение беженца
  ///
  /// - 38 - Иные документы, признаваемые документами, удостоверяющими личность лиц
  /// без гражданства в соответствии с законодательством Российской Федерации и международным договором Российской Федерации
  ///
  /// - 40 - Документ, удостоверяющий личность лица, не имеющего действительного документа,
  /// удостоверяющего личность, на период рассмотрения заявления о признании гражданином Российской Федерации
  /// или о приеме в гражданство Российской Федерации
  @JsonKey(name: JsonKeys.documentCode)
  final String? documentCode;

  /// Реквизиты документа, удостоверяющего личность (например: серия и номер паспорта)
  @JsonKey(name: JsonKeys.documentData)
  final String? documentData;

  /// Адрес покупателя (клиента), грузополучателя. Максимум 256 символов
  @JsonKey(name: JsonKeys.address)
  final String? address;
}
