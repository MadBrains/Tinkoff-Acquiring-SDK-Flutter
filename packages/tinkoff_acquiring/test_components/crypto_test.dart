import 'dart:typed_data';

import 'package:test/test.dart';

import 'package:tinkoff_acquiring/src/utils/crypto_utils.dart';

void start() {
  test('sha256', () {
    final String testData = CryptoUtils.sha256(
        '100000testTokenExampleTinkoffBankTestTinkoffBankTest');
    const String resultData =
        '48d4ca825aab2ede06736d3eae099bd56ac97bd1bcdd598aff210f729de4eb21';

    expect(testData, resultData);
  });

  test('base64', () {
    final String testData =
        CryptoUtils.base64(Uint8List.fromList('123q6e321'.codeUnits));
    const String resultData = 'MTIzcTZlMzIx';

    expect(testData, resultData);
  });
}
