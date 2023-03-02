import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_second_app/screen/auth1/login.dart';
import 'package:my_second_app/screen/homepage.dart';

void main() {
  testWidgets('For you page', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomeScreen(),
      ),
    );
    Finder title = find.text("For You");
    expect(title, findsOneWidget);
  });
}
