import 'dart:io';

/// Get full Ipv6 or Ipv4 address:
/// - 192.168.000.001
/// - fe80:0000:0000:0820:a918:0000:0000:74b3
Future<String?> getIpAddress() async {
  for (final InternetAddress internetAddress in (await NetworkInterface.list(
    includeLinkLocal: true,
    includeLoopback: true,
  ))
      .fold<List<InternetAddress>>(
    <InternetAddress>[],
    (List<InternetAddress> previousValue, NetworkInterface element) {
      if (Platform.isIOS && !element.name.contains('en')) {
        return previousValue;
      }
      if (Platform.isAndroid && !element.name.contains('wlan')) {
        return previousValue;
      }
      return previousValue..addAll(element.addresses);
    },
  )) {
    if (!internetAddress.isLoopback) {
      if (internetAddress.type == InternetAddressType.IPv6) {
        return internetAddress.address.formatExpandedIpv6Address();
      }

      if (internetAddress.type == InternetAddressType.IPv4) {
        return internetAddress.address.formatExpandedIpv4Address();
      }

      return internetAddress.address;
    }
  }

  return null;
}

extension on String {
  static const int _ipv4PartLength = 3;
  static const int _ipv6PartLength = 4;

  /// 192.168.0.1 to 192.168.000.001
  String formatExpandedIpv4Address() {
    final List<String> splitedAddress = split('.');

    return splitedAddress.reduce(
      (String o, String n) {
        final int partLength = n.length;
        if (partLength != _ipv4PartLength) {
          final int gripPartLength = _ipv4PartLength - partLength;
          for (int i = 0; i < gripPartLength; i++) {
            n = '0$n';
          }
        }

        return '$o:$n';
      },
    );
  }

  /// fe80::820:a918:0:0:74b3 to fe80:0000:0000:0820:a918:0000:0000:74b3
  String formatExpandedIpv6Address() {
    final String address = replaceAll(RegExp('%.+'), '');

    final List<String> splitedAddress = address.split(':');

    return splitedAddress.reduce(
      (String o, String n) {
        // handling "::"
        if (n.isEmpty) {
          // 8 parts - (full length - 1 empty)
          final int gripEmptyPartLength = 8 - (splitedAddress.length - 1);
          final List<String> emptyParts =
              List<String>.filled(gripEmptyPartLength, '0000');
          return '$o:${emptyParts.join(':')}';
        }

        final int partLength = n.length;
        if (partLength != _ipv6PartLength) {
          final int gripPartLength = _ipv6PartLength - partLength;
          for (int i = 0; i < gripPartLength; i++) {
            n = '0$n';
          }
        }

        return '$o:$n';
      },
    );
  }
}
