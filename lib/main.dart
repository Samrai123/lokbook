import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_second_app/app/route.dart';
import 'package:my_second_app/helper/objectbox.dart';
import 'package:my_second_app/state/objectbox_state.dart';
import 'package:my_second_app/wearos/login.dart';

import 'screen/splash_screen.dart';

void main() async {
  AwesomeNotifications().initialize(
    'resource://drawable/launcher',
    [
      NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic Notification',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: Colors.red,
        importance: NotificationImportance.Max,
        ledColor: Colors.white,
        channelShowBadge: true,
      )
    ],
  );
  WidgetsFlutterBinding.ensureInitialized();
  ObjectBoxInstance.deleteDatabase();
  //create an object for objectboxinstance
  ObjectBoxState.objectBoxInstance = await ObjectBoxInstance.init();
  runApp(LookBook());
}

class LookBook extends StatelessWidget {
  Color _primaryColor = Color.fromARGB(255, 48, 43, 35);
  Color _accentColor = Color.fromARGB(255, 12, 12, 12);

  // Design color
  // Color _primaryColor= HexColor('#FFC867');
  // Color _accentColor= HexColor('#FF3CBD');

  // Our Logo Color
  // Color _primaryColor= HexColor('#D44CF6');
  // Color _accentColor= HexColor('#5E18C8');

  // Our Logo Blue Color
  //Color _primaryColor= HexColor('#651BD2');
  //Color _accentColor= HexColor('#320181');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LookBook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: _primaryColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      initialRoute: SplashScreen.route,
      //for wearOs
      // initialRoute: LoginScreenWear.route,

      routes: getAppRoutes,
    );
  }
}
