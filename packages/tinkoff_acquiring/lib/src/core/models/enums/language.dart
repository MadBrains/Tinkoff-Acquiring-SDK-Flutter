import 'package:json_annotation/json_annotation.dart';

/// Список языков платежной формы
enum Language {
  /// ru — русский
  @JsonValue('ru')
  ru,

  /// en — английский
  @JsonValue('en')
  en,
}
