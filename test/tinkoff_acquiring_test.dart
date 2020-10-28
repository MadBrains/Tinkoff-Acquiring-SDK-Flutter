import 'package:flutter_test/flutter_test.dart';

import '../test_components/crypto_test.dart' as crypto_test;
import '../test_components/hash_test.dart' as hash_test;
import '../test_components/sdk_single_test.dart' as single_test;
import '../test_components/sdk_complex_test.dart' as complex_test;

Future<void> main() async {
  group('Crypto Tests', () {
    crypto_test.start();
  });

  group('Hash Tests', () {
    hash_test.start();
  });

  group('SDK Single Tests', () {
    single_test.start();
  });

  group('SDK Complex Tests', () {
    complex_test.start();
  });
}
