<h1 align="center">Flutter Tinkoff Acquiring SDK</h1>

<a href="https://madbrains.ru/"><img src="https://firebasestorage.googleapis.com/v0/b/mad-brains-web.appspot.com/o/logo.png?alt=media" width="200" align="right" style="margin: 20px;"/></a>
 
Acquiring SDK позволяет интегрировать [Интернет-Эквайринг Tinkoff][acquiring] в мобильные приложения для платформы iOS и Android. 

[Документация по доступным API][documentation].

## Возможности SDK

- Проведение платежей (в том числе рекуррентных);
- Сохранение банковских карт клиента;
- Получение информации о клиенте и сохраненных картах;
- Управление сохраненными картами;
- Интеграция с онлайн-кассами;
- Оплата через Систему быстрых платежей (СБП) по QR;

## Подключение
Для подключения добавьте в файл Pubspec зависимости:
```yaml
dependencies:
  tinkoff_acquiring: <lastles>
  tinkoff_acquiring_flutter: <lastles> # for UI
```

## Подготовка к работе

Для начала работы с SDK вам понадобятся:
* **Terminal key** - терминал Продавца; 
* **Password** - пароль от терминала (опционально);
* **Public key** – публичный ключ. Используется для шифрования данных. Необходим для интеграции вашего приложения с интернет-эквайрингом Тинькофф.

Данные выдаются в личном кабинете после подключения к [Интернет-Эквайрингу][acquiring].

SDK позволяет настроить режим работы (debug/prod), по умолчанию - режим debug.
Также SDK позволяет настраивать проксирование запросов, по умолчанию все запросы идут на сервера Tinkoff.

### Credential

Чтобы настроить режим работы, установите параметры:
```dart
final TinkoffAcquiring acquiring = TinkoffAcquiring(
  TinkoffAcquiringConfig.credential(
    terminalKey: terminalKey,
    password: password, // if not passed, it will work in passwordless mode
    isDebugMode: false,
  ),
);
```

### Token

Если у вас подпись запроса происходит на стороне, то можно использовать следующий конструктор:
```dart
final TinkoffAcquiring acquiring = TinkoffAcquiring(
  TinkoffAcquiringConfig.token(
    terminalKey: terminalKey,
    isDebugMode: false,
  ),
);
```

При этом в модели запроса нужно добавить signToken:
```dart
InitRequest(
  signToken: ...,
  ...
)

request.copyWith(signToken: ...);
```

### Proxy

Если вы хотите использовать proxy, то воспользуйтесь следующим конструктором:
```dart
final TinkoffAcquiring acquiring = TinkoffAcquiring(
  TinkoffAcquiringConfig.proxy(
    proxyDomain: terminalKey,
    proxyPath: password,
    isDebugMode: false,
    globalHeaders: <String, String>{...},
    mapping: (AcquiringRequest request, bool isDebugMode) {
      if (request is InitRequest) {
        return const ProxyRequest(
          headers: <String, String>{...},
          methodPath: '/Init',
        );
      }

      ...

      return null;
    },
  ),
);
```

## Пример работы

Пример работы SDK доступен в [Example][example]

## Схема работы SDK
<details><img src="https://acdn.tinkoff.ru/static/pages/files/d3cd0230-03a1-47e6-bacf-dfdf9c8c1bea.png"/></details>

[documentation]: https://www.tinkoff.ru/kassa/develop/api/payments/
[acquiring]: https://www.tinkoff.ru/business/internet-acquiring/
[example]: https://github.com/MadBrains/Tinkoff-Acquiring-SDK-Flutter/tree/main/example