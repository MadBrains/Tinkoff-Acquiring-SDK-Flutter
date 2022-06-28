import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../../../utils/extensions.dart';
import 'base_request.dart';

/// Базовый класс создания запроса Acquiring API
abstract class AcquiringRequest extends BaseRequest {
  /// Конструктор базового класса для запросов
  AcquiringRequest(this.signToken);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        if (signToken != null) JsonKeys.token: signToken,
      };

  /// Заголовок метода
  Map<String, String> get headers => NetworkSettings.baseHeaders;

  /// Метод запроса
  String get apiMethod;

  /// Опциональный параметр: готовая подпись запроса
  @JsonKey(name: JsonKeys.token)
  final String? signToken;

  @override
  AcquiringRequest copyWith({String? signToken});
}

/// extensions for [Object?]
extension ObjectRequestValidate on Object? {
  /// валидация поля по типу
  void validate(String fieldName, {bool checkNull = false}) {
    assert(
      () {
        if (!checkNull) return true;

        return this != null;
      }(),
      "Unable to build request: field '$fieldName' is null",
    );
    assert(
      () {
        final Object? object = this;
        if (object is String && object.isEmpty) return false;

        return true;
      }(),
      "Unable to build request: field '$fieldName' is empty",
    );
    assert(
      () {
        final Object? object = this;
        if (object is int && object < 0) return false;

        return true;
      }(),
      "Unable to build request: field '$fieldName' is negative",
    );
  }

  /// валидация OrderId
  void validateOrderId(String fieldName, {bool checkNull = false}) {
    validate(fieldName, checkNull: checkNull);
    assert(
      () {
        final Object? object = this;
        if (object is int && object.length > 20) return false;

        return true;
      }(),
      "Unable to build request: field '$fieldName' is not valid",
    );
  }

  /// валидация Amount
  void validateAmount(String fieldName, {bool checkNull = false}) {
    validate(fieldName, checkNull: checkNull);
    assert(
      () {
        final Object? object = this;
        if (object is int && object.length > 10) return false;

        return true;
      }(),
      "Unable to build request: field '$fieldName' is not valid",
    );
  }

  /// валидация Ip
  void validateIp(String fieldName, {bool checkNull = false}) {
    validate(fieldName, checkNull: checkNull);
    assert(
      () {
        final Object? object = this;
        if (object is String && (object.length < 7 || object.length > 45)) {
          return false;
        }

        return true;
      }(),
      "Unable to build request: field '$fieldName' is not valid",
    );
  }

  /// валидация Description
  void validateDescription(String fieldName, {bool checkNull = false}) {
    validate(fieldName, checkNull: checkNull);
    assert(
      () {
        final Object? object = this;
        if (object is String && object.length > 250) {
          return false;
        }

        return true;
      }(),
      "Unable to build request: field '$fieldName' is not valid",
    );
  }

  /// валидация CustomerKey
  void validateCustomerKey(String fieldName, {bool checkNull = false}) {
    validate(fieldName, checkNull: checkNull);
    assert(
      () {
        final Object? object = this;
        if (object is String && object.length > 36) {
          return false;
        }

        return true;
      }(),
      "Unable to build request: field '$fieldName' is not valid",
    );
  }

  /// валидация Email
  void validateEmail(String fieldName, {bool checkNull = false}) {
    validate(fieldName, checkNull: checkNull);
    assert(
      () {
        final Object? object = this;
        if (object is String) {
          return RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')
              .hasMatch(object);
        }

        return true;
      }(),
      "Unable to build request: field '$fieldName' is not valid",
    );
  }

  /// валидация Phone
  void validatePhone(String fieldName, {bool checkNull = false}) {
    validate(fieldName, checkNull: checkNull);
    assert(
      () {
        final Object? object = this;
        if (object is String) {
          return RegExp(r'^\+[0-9](?:[\d]*)$').hasMatch(object);
        }

        return true;
      }(),
      "Unable to build request: field '$fieldName' is not valid",
    );
  }
}
