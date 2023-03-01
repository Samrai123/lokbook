import 'package:flutter_test/flutter_test.dart';
import 'package:my_second_app/main.dart';

void main() {
  testWidgets('Counter increaments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(LookBook());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
  });
}
