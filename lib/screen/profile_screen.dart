import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_second_app/app/constants.dart';
import 'package:my_second_app/data_source/remote_data_source/response/login_response.dart';
import 'package:my_second_app/data_source/remote_data_source/response/profile_response.dart';
import 'package:my_second_app/data_source/remote_data_source/response/user_response.dart';
import 'package:my_second_app/model/user.dart';
import 'package:my_second_app/objectbox.g.dart';
import 'package:my_second_app/repository/user_repo.dart';

import 'package:my_second_app/screen/Widget/header_widge.dart';
import 'package:my_second_app/screen/forgetpass.dart';
import 'package:my_second_app/screen/login.dart';
import 'package:my_second_app/screen/post_screen.dart';
import 'package:my_second_app/screen/register.dart';
import 'package:my_second_app/screen/splash_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String route = "profileScreen";
  @override
  State<StatefulWidget> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;
  @override
  void initState() {
    super.initState();
    debugPrint(Constant.token);
  }

  // @override
  // void didChangeDependencies() {
  //   user = ModalRoute.of(context)!.settings.arguments as User;
  //   super.didChangeDependencies();
  // }
  // void getData() async{
  //   try{
  //     var response = await Dio().get
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ])),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(
              top: 16,
              right: 16,
            ),
            child: Stack(
              children: <Widget>[
                Icon(Icons.notifications),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: Text(
                      '5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                0.0,
                1.0
              ],
                  colors: [
                Theme.of(context).primaryColor.withOpacity(0.2),
                Theme.of(context).accentColor.withOpacity(0.5),
              ])),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor,
                    ],
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "LookBook",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.screen_lock_landscape_rounded,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Splash Screen',
                  style: TextStyle(
                      fontSize: 17, color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SplashScreen(title: "Splash Screen")));
                },
              ),
              ListTile(
                leading: Icon(Icons.login_rounded,
                    size: _drawerIconSize,
                    color: Theme.of(context).accentColor),
                title: Text(
                  'Login Page',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.person_add_alt_1,
                    size: _drawerIconSize,
                    color: Theme.of(context).accentColor),
                title: Text(
                  'Registration Page',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.password_rounded,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Forgot Password Page',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen()),
                  );
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder<ProfileResponse>(
        future: UserRepositoryImpl().userInfo(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            ProfileResponse profileResponse = snapshot.data!;
            print(profileResponse.email);
            return Container(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 150,
                      child: Image.network(
                        Constant.userImageURL + profileResponse.image!,
                      ),
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        children: [
                          // Container(
                          //   padding: EdgeInsets.all(10),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(100),
                          //     border: Border.all(width: 5, color: Colors.white),
                          //     color: Colors.white,
                          //     boxShadow: [
                          //       BoxShadow(
                          //         color: Colors.black12,
                          //         blurRadius: 20,
                          //         offset: const Offset(5, 5),
                          //       ),
                          //     ],
                          //   ),
                          //   child: Icon(
                          //     Icons.person,
                          //     size: 80,
                          //     color: Colors.grey.shade300,
                          //   ),
                          // ),
                          SizedBox(
                            height: 150,
                          ),
                          Text(
                            "${profileResponse.fname!} ${profileResponse.lname!}",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, bottom: 4.0),
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    "User Information",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            ...ListTile.divideTiles(
                                              color: Colors.grey,
                                              tiles: [
                                                ListTile(
                                                  leading: Icon(Icons.email),
                                                  title: Text("Email"),
                                                  subtitle: Text(
                                                      "${profileResponse.email}"),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

// class DisplayProfileWidget extends StatelessWidget {
//   final User user;
//   const DisplayProfileWidget(this.user, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Container(
//               alignment: Alignment.center,
//               height: 100,
//               child: Image.network(
//                 Constant.userImageURL + user.image!,
//               ),
//             ),
//             const SizedBox(
//               height: 60,
//             ),
//             Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
//               padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//               child: Column(
//                 children: [
//                   // Container(
//                   //   padding: EdgeInsets.all(10),
//                   //   decoration: BoxDecoration(
//                   //     borderRadius: BorderRadius.circular(100),
//                   //     border: Border.all(width: 5, color: Colors.white),
//                   //     color: Colors.white,
//                   //     boxShadow: [
//                   //       BoxShadow(
//                   //         color: Colors.black12,
//                   //         blurRadius: 20,
//                   //         offset: const Offset(5, 5),
//                   //       ),
//                   //     ],
//                   //   ),
//                   //   child: Icon(
//                   //     Icons.person,
//                   //     size: 80,
//                   //     color: Colors.grey.shade300,
//                   //   ),
//                   // ),
//                   SizedBox(
//                     height: 100,
//                   ),
//                   Text(
//                     '${user.fname} ${user.lname}',
//                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(10),
//                     child: Column(
//                       children: <Widget>[
//                         Container(
//                           padding:
//                               const EdgeInsets.only(left: 8.0, bottom: 4.0),
//                           alignment: Alignment.topLeft,
//                           child: const Text(
//                             "User Information",
//                             style: TextStyle(
//                               color: Colors.black87,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 16,
//                             ),
//                             textAlign: TextAlign.left,
//                           ),
//                         ),
//                         Card(
//                           child: Container(
//                             alignment: Alignment.topLeft,
//                             padding: EdgeInsets.all(15),
//                             child: Column(
//                               children: <Widget>[
//                                 Column(
//                                   children: <Widget>[
//                                     ...ListTile.divideTiles(
//                                       color: Colors.grey,
//                                       tiles: [
//                                         ListTile(
//                                           leading: Icon(Icons.email),
//                                           title: Text("Email"),
//                                           subtitle: Text("${user.email}"),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
