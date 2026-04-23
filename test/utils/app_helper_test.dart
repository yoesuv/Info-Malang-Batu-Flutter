import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:info_malang_batu_flutter/src/utils/app_helper.dart';

void main() {
  group('isInDebugMode', () {
    test('returns true in test environment where asserts are enabled', () {
      expect(isInDebugMode, isTrue);
    });
  });

  group('showSnackBarSuccess', () {
    testWidgets('shows SnackBar with provided title', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: _TestWidget(fn: showSnackBarSuccess, title: 'Success!'),
          ),
        ),
      );

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
      final textWidget = snackBar.content as Text;
      expect(textWidget.data, 'Success!');
    });

    testWidgets('shows SnackBar with green background', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: _TestWidget(fn: showSnackBarSuccess, title: 'OK'),
          ),
        ),
      );

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
      expect(snackBar.backgroundColor, Colors.green[700]);
    });

    testWidgets('shows SnackBar with white text style', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: _TestWidget(fn: showSnackBarSuccess, title: 'OK'),
          ),
        ),
      );

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
      final textWidget = snackBar.content as Text;
      expect(textWidget.style?.color, Colors.white);
    });
  });

  group('showSnackBarWarning', () {
    testWidgets('shows SnackBar with yellow background and black text', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: _TestWidget(fn: showSnackBarWarning, title: 'Warning!'),
          ),
        ),
      );

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
      expect(snackBar.backgroundColor, Colors.yellow[700]);

      final textWidget = snackBar.content as Text;
      expect(textWidget.style?.color, Colors.black);
      expect(textWidget.data, 'Warning!');
    });
  });

  group('showSnackBarError', () {
    testWidgets('shows SnackBar with red background', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: _TestWidget(fn: showSnackBarError, title: 'Error!'),
          ),
        ),
      );

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
      expect(snackBar.backgroundColor, Colors.red[700]);
    });

    testWidgets('shows SnackBar with provided error title', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: _TestWidget(fn: showSnackBarError, title: 'Something failed'),
          ),
        ),
      );

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
      final textWidget = snackBar.content as Text;
      expect(textWidget.data, 'Something failed');
    });
  });

  group('All SnackBars', () {
    testWidgets('each function produces exactly one SnackBar', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return Column(
                  children: [
                    TextButton(
                      onPressed: () => showSnackBarSuccess(context, 'Success'),
                      child: const Text('btn1'),
                    ),
                    TextButton(
                      onPressed: () => showSnackBarWarning(context, 'Warning'),
                      child: const Text('btn2'),
                    ),
                    TextButton(
                      onPressed: () => showSnackBarError(context, 'Error'),
                      child: const Text('btn3'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('btn1'));
      await tester.pumpAndSettle();
      expect(find.byType(SnackBar), findsOneWidget);

      await tester.tap(find.text('btn2'));
      await tester.pumpAndSettle();
      expect(find.byType(SnackBar), findsOneWidget);

      await tester.tap(find.text('btn3'));
      await tester.pumpAndSettle();
      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}

typedef SnackBarFunction = void Function(BuildContext context, String title);

class _TestWidget extends StatelessWidget {
  const _TestWidget({required this.fn, required this.title});

  final SnackBarFunction fn;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => fn(context, title),
      child: const Text('Tap'),
    );
  }
}
