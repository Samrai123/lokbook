import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:my_second_app/screen/arithematic_output.dart';
import 'package:my_second_app/screen/arithematics_screen.dart';
import 'package:my_second_app/screen/arthimetic.dart';
import 'package:my_second_app/screen/calculator_screen.dart';
import 'package:my_second_app/screen/card_screen.dart';
import 'package:my_second_app/screen/column_screen.dart';
import 'package:my_second_app/screen/dashboard.dart';
import 'package:my_second_app/screen/data_table_screen.dart';
import 'package:my_second_app/screen/display_student.dart';
import 'package:my_second_app/screen/flexible_screen.dart';
import 'package:my_second_app/screen/gridview_screen.dart';
import 'package:my_second_app/screen/list_tile.dart';
import 'package:my_second_app/screen/stack_screen.dart';

import 'screen/container_screen.dart';
import 'screen/row_screen.dart';
import 'screen/student_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter for class',
      initialRoute: '/dashboard',
      routes: {
        //'/': (context) => const ListTileScreen(),
        '/arithematicOutputScreen': (context) => const ArithematicOutput(),
        //'/': (context) => const RowScreen(),
        //'/': (context) => const ContainerScreen(),
        //'/fs': (context) => const FlexibleScreen(),
        '/s': (context) => const StudentDetailsScreen(),
        '/displayStudent': (context) => const DisplayStudentScreen(),
        '/cardscreen': (context) => const CardScreen(),
        '/gridview': (context) => const GridViewScreen(),
        '/calculatorscreen': (context) => const CalculatorScreen(),
        '/datatable': (context) => const DataTableScreen(),
        '/stackscreen': (context) => const StackScreen(),
        '/dashboard': (context) => const DashboardScreen(),
      },
    ),
  );
}
