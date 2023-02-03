import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_second_app/helper/objectbox.dart';
import 'package:my_second_app/state/objectbox_state.dart';

import 'screen/splash_screen.dart';

void main() async {
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
      theme: ThemeData(
        primaryColor: _primaryColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      home: SplashScreen(title: 'LOOKBOOK'),
    );
  }
}
