import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/error_container.dart';

void main() {
  Widget createWidgetUnderTest({String? title, Function()? onPress}) {
    return MaterialApp(
      home: Scaffold(
        body: ErrorContainer(title: title, onPress: onPress),
      ),
    );
  }

  group('ErrorContainer Widget Tests', () {
    testWidgets('should display error icon', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final iconFinder = find.byIcon(Icons.error_outline);
      expect(iconFinder, findsOneWidget);

      final icon = tester.widget<Icon>(iconFinder);
      expect(icon.color, Colors.red);
      expect(icon.size, 64);
    });

    testWidgets('should display empty text when title is null', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final textFinder = find.text('');
      expect(textFinder, findsOneWidget);

      final text = tester.widget<Text>(textFinder);
      expect(text.style?.color, Colors.black);
      expect(text.style?.fontSize, 16);
      expect(text.style?.fontWeight, FontWeight.w500);
    });

    testWidgets('should display title text when provided', (tester) async {
      const testTitle = 'Something went wrong!';
      await tester.pumpWidget(createWidgetUnderTest(title: testTitle));

      final textFinder = find.text(testTitle);
      expect(textFinder, findsOneWidget);

      final text = tester.widget<Text>(textFinder);
      expect(text.style?.color, Colors.black);
      expect(text.style?.fontSize, 16);
      expect(text.style?.fontWeight, FontWeight.w500);
    });

    testWidgets('should display Try Again button', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final buttonFinder = find.widgetWithText(ElevatedButton, 'Try Again');
      expect(buttonFinder, findsOneWidget);

      final buttonText = find.text('Try Again');
      final text = tester.widget<Text>(buttonText);
      expect(text.style?.fontSize, 14);
    });

    testWidgets('should trigger callback when Try Again button is pressed', (
      tester,
    ) async {
      bool pressed = false;
      await tester.pumpWidget(
        createWidgetUnderTest(
          title: 'Error occurred',
          onPress: () {
            pressed = true;
          },
        ),
      );

      await tester.tap(find.widgetWithText(ElevatedButton, 'Try Again'));
      await tester.pump();

      expect(pressed, isTrue);
    });

    testWidgets('should have correct layout structure', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest(title: 'Test Error'));

      // Verify Column is used for layout within ErrorContainer
      final columnFinder = find.descendant(
        of: find.byType(ErrorContainer),
        matching: find.byType(Column),
      );
      expect(columnFinder, findsOneWidget);

      // Verify correct number of children in column (Icon, SizedBox, Text, SizedBox, ElevatedButton)
      final column = tester.widget<Column>(columnFinder);
      expect(column.children.length, 5);
      expect(column.mainAxisSize, MainAxisSize.min);
    });

    testWidgets('should display all expected widgets in order', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest(title: 'Test'));

      // Find all widgets in the column
      final column = tester.widget<Column>(find.byType(Column));

      expect(column.children[0], isA<Icon>());
      expect(column.children[1], isA<SizedBox>());
      expect(column.children[2], isA<Text>());
      expect(column.children[3], isA<SizedBox>());
      expect(column.children[4], isA<ElevatedButton>());
    });

    testWidgets('should have correct spacing between elements', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Find SizedBoxes within the ErrorContainer's Column children
      final columnFinder = find.descendant(
        of: find.byType(ErrorContainer),
        matching: find.byType(Column),
      );
      final column = tester.widget<Column>(columnFinder);

      // Check that SizedBox widgets in the column have height 8
      int sizedBoxCount = 0;
      for (final child in column.children) {
        if (child is SizedBox && child.height == 8) {
          sizedBoxCount++;
        }
      }
      expect(sizedBoxCount, 2);
    });

    testWidgets('should work without onPress callback', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest(title: 'No callback'));

      // Should not throw when button is pressed without callback
      await tester.tap(find.widgetWithText(ElevatedButton, 'Try Again'));
      await tester.pump();

      // Widget should still exist
      expect(find.byType(ErrorContainer), findsOneWidget);
    });

    testWidgets('should use const constructor', (tester) async {
      // Verify const constructor is used properly
      // Using const with identical parameters should compile and work
      const container1 = ErrorContainer();
      const container2 = ErrorContainer(key: Key('test'));

      // Widgets should be created successfully
      expect(container1, isA<ErrorContainer>());
      expect(container2, isA<ErrorContainer>());
      expect(container1.key, isNull);
      expect(container2.key, const Key('test'));
    });
  });
}
