/// Extensions for [num]
extension NumEx on num {
  /// length in num type
  int get length => toString().length;
}

/// Extensions for [Map]
extension MapEx<K, V> on Map<K, V> {
  /// normalize string
  String toNormalizeString() => toString().replaceAll(RegExp(r'^{|}$'), '');
}
