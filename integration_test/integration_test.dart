import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// The application under test.
import 'package:counter_integration_test/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Counter App Integration Test', () {
    testWidgets('tap on the floating action button; verify counter',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      final buttonFinder = find.byKey(const Key('increment'));

      expect(find.text('0'), findsOneWidget);
      await Future.delayed(Duration(seconds: 1));
      
      await tester.tap(buttonFinder);
      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);
      await Future.delayed(Duration(seconds: 1));

      await tester.tap(buttonFinder);
      await tester.pumpAndSettle();
      expect(find.text('2'), findsOneWidget);
      await Future.delayed(Duration(seconds: 1));

      await tester.pumpAndSettle();
    });
  });
}