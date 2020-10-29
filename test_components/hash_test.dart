import 'package:flutter_test/flutter_test.dart';

import 'package:tinkoff_acquiring/src/core/utils/comparer.dart';

class _TestWithComparer with Comparer {
  _TestWithComparer(this.a);

  final List<Object> a;

  @override
  Map<String, Object> get equals => <String, Object>{'a': a};
}

class _TestWithoutComparer {
  _TestWithoutComparer(this.a);

  final List<Object> a;
}

void start() {
  test('With Comparer', () {
    final _TestWithComparer testData = _TestWithComparer(<Object>[1, '2', 3.3]);
    final _TestWithComparer resultData =
        _TestWithComparer(<Object>[1, '2', 3.3]);

    expect(testData == resultData, true);
    expect(testData.hashCode == resultData.hashCode, true);
  });

  test('Without Comparer', () {
    final _TestWithoutComparer testData =
        _TestWithoutComparer(<Object>[1, '2', 3.3]);
    final _TestWithoutComparer resultData =
        _TestWithoutComparer(<Object>[1, '2', 3.3]);

    expect(testData == resultData, false);
    expect(testData.hashCode == resultData.hashCode, false);
  });
}
