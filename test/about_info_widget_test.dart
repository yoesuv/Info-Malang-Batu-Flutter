import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/about_info.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  group('AboutInfo Widget Tests', () {
    setUp(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      PackageInfo.setMockInitialValues(
        appName: 'Info Malang Batu',
        packageName: 'com.yoesuv.info_malang_batu',
        version: '2.0.8',
        buildNumber: '1',
        buildSignature: '',
      );
    });

    testWidgets('should display app title', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: AboutInfo()));

      await tester.pumpAndSettle();

      expect(find.text('Info Malang Batu'), findsOneWidget);
    });

    testWidgets('should display Flutter Version label', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: AboutInfo()));

      await tester.pumpAndSettle();

      expect(find.text('Flutter Version'), findsOneWidget);
    });

    testWidgets('should display github URL', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: AboutInfo()));

      await tester.pumpAndSettle();

      expect(
        find.text('https://github.com/yoesuv/Info-Malang-Batu-Flutter'),
        findsOneWidget,
      );
    });

    testWidgets('should display app version after loading', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: AboutInfo()));

      await tester.pumpAndSettle();

      expect(find.text('Versi 2.0.8'), findsOneWidget);
    });

    testWidgets('should display Divider', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: AboutInfo()));

      await tester.pumpAndSettle();

      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('should display Scaffold', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: AboutInfo()));

      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);
    });
  });
}
