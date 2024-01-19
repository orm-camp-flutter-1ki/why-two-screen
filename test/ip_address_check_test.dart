import 'package:flutter_test/flutter_test.dart';

void main() {
  test('정규식 연습', () {
    expect(isValidIpAddress('192.168.0.1'), true);
    expect(isValidIpAddress('192.168.0.2'), true);
    expect(isValidIpAddress('192.168.0.3'), true);
    expect(isValidIpAddress('192.168.0.4'), true);

    expect(isValidIpAddress('192.400.1.10.1000...'), false);
    expect(isValidIpAddress('4.3.2.1'), true);
    expect(isValidIpAddress('0..33.444...'), false);
    expect(isValidIpAddress('1.2.3.4'), true);
  });
}

bool isValidIpAddress(String ipAddress) {
  final RegExp exp = RegExp(
    r'\b(?:(?:2(?:[0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9])\.){3}(?:(?:2([0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9]))\b'
  );

  return exp.hasMatch(ipAddress);
}
