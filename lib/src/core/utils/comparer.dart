// ignore_for_file: parameter_assignments

import 'package:collection/collection.dart';

import '../utils/extensions.dart';

/// `Runtime` генератор [hashCode], [==] и [toString]
///
/// Использует `Jenkins Hash Functions` и `Deep Comparison`
mixin Comparer {
  /// Объекты для сравнения
  Map<String, Object> get equals;

  @override
  int get hashCode =>
      runtimeType.hashCode ^ _finish(equals.values?.fold(0, _combine) ?? 0);

  @override
  bool operator ==(Object other) =>
      (identical(this, other)) ||
      other is Comparer &&
          runtimeType == other.runtimeType &&
          _equals(other.equals.values.toList(), equals.values.toList());

  @override
  String toString() => '$runtimeType(${equals.toNormalizeString()})';

  static const DeepCollectionEquality _equality = DeepCollectionEquality();

  /// Determines whether [list1] and [list2] are equal.
  bool _equals<T>(List<T> list1, List<T> list2) {
    if (identical(list1, list2)) return true;
    if (list1 == null || list2 == null) return false;
    final int length = list1.length;
    if (length != list2.length) return false;

    for (int i = 0; i < length; i++) {
      final dynamic unit1 = list1[i];
      final dynamic unit2 = list2[i];

      if (unit1 is Iterable || unit1 is Map) {
        if (!_equality.equals(unit1, unit2)) return false;
      } else if (unit1?.runtimeType != unit2?.runtimeType) {
        return false;
      } else if (unit1 != unit2) {
        return false;
      }
    }
    return true;
  }

  /// Jenkins Hash Functions
  /// https://en.wikipedia.org/wiki/Jenkins_hash_function
  int _combine(int hash, dynamic object) {
    if (object is Map) {
      object.forEach((dynamic key, dynamic value) {
        hash = hash ^ _combine(hash, <dynamic>[key, value]);
      });
      return hash;
    }
    if (object is Iterable) {
      for (final dynamic value in object) {
        hash = hash ^ _combine(hash, value);
      }
      return hash ^ object.length;
    }

    hash = 0x1fffffff & (hash + object.hashCode);
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  int _finish(int hash) {
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}
