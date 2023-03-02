import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_second_app/screen/auth1/login.dart';
import 'package:my_second_app/screen/category/search_page.dart';
import 'package:my_second_app/screen/homepage.dart';
import 'package:my_second_app/screen/profile_screen.dart';
import 'package:my_second_app/screen/visual/post_screen.dart';

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

  testWidgets("Search", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: SearchScreen(),
    ));
    Finder title = find.text("Search");
    expect(title, findsOneWidget);
  });

  testWidgets("Profiel page", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ProfileScreen(),
    ));
    Finder title = find.text("Profile Page");
    expect(title, findsOneWidget);
  });
}
