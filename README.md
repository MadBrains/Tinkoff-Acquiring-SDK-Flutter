<h1 align="center">Flutter Tinkoff Acquiring SDK</h1>

<a href="https://madbrains.ru/"><img src="https://firebasestorage.googleapis.com/v0/b/mad-brains-web.appspot.com/o/logo.png?alt=media" width="200" align="right" style="margin: 20px;"/></a>

[Read this in Russian](README.ru.md)

Acquiring SDK allows you to integrate [Tinkoff Internet Acquiring][acquiring] into mobile applications for iOS and Android platforms.

[Available API Documentation][documentation].

## SDK Features

- Making payments (including recurring payments);
- Saving customers bank cards;
- Getting information about customers and saved bank cards;
- Management of saved bank cards;
- Integration with online checkouts;

## Installing
Add this to your package's pubspec.yaml file:
```yaml
dependencies:
  tinkoff_acquiring: 1.0.2
```

## Before usage

To get started with the SDK, you'll need:
* **Terminal key** - seller's terminal key; 
* **Password** - terminal password;
* **Public key** – public key. Used to encrypt data. Required to integrate your application with Tinkoff Internet acquiring.

These values are issued in your personal account after connecting to [Tinkoff Internet Acquiring][acquiring].

SDK allows you to configure operating mode (debug / prod), by default - debug.
The SDK also allows you to configure request proxying, by default all requests go to Tinkoff servers.

To configure the operation mode, set the following parameters:
```dart
final TinkoffAcquiring acquiring = TinkoffAcquiring(
  terminalKey: terminalKey,
  password: password,
  debug: true,
  proxyUrl: 'https://server.com/'
);
```

## Example

The [Example][example] is in the corresponding folder

## SDK workflow
<details><img src="https://acdn.tinkoff.ru/static/pages/files/d3cd0230-03a1-47e6-bacf-dfdf9c8c1bea.png"/></details>

[documentation]: https://oplata.tinkoff.ru/develop/api/payments/
[acquiring]: https://www.tinkoff.ru/business/internet-acquiring/
[example]: https://github.com/MadBrains/Tinkoff-Acquiring-SDK-Flutter/tree/main/example/