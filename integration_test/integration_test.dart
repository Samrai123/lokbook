import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_second_app/app/route.dart';
import 'package:my_second_app/screen/auth1/login.dart';
import 'package:my_second_app/screen/auth1/register.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login user', (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        title: 'Visual Content Plaform using APi',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        initialRoute: LoginScreen.route,
        routes: getAppRoutes,
      ),
    );
    Finder txtUsername = find.byKey(const Key('txtUsername'));
    await widgetTester.enterText(txtUsername, 'samrai');

    Finder txtPassword = find.byKey(const Key('txtPassword'));
    await widgetTester.enterText(txtPassword, 'samrai123');

    Finder btnLogin = find.byKey(const Key('btnLogin'));
    await widgetTester.tap(btnLogin);

    await widgetTester.pumpAndSettle(const Duration(seconds: 5));

    Finder HomeScreen = find.text('For You');
    expect(HomeScreen, findsOneWidget);
  });
}
