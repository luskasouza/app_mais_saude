import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_driver/flutter_driver.dart';

void main() {
  group('App Tests', () {
    FlutterDriver? driver;  

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver!.close();  
      }
    });

    test('example test', () async {
      // Add your test code here.
    });
  });
}
