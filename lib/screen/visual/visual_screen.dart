import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:my_second_app/app/constants.dart';
import 'package:my_second_app/app/controller.dart';
import 'package:my_second_app/model/visual.dart';

class VisualScreen extends StatefulWidget {
  const VisualScreen({super.key});
  static const String route = "visualScreen";
  @override
  State<VisualScreen> createState() => _VisualScreenState();
}

class _VisualScreenState extends State<VisualScreen> {
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
  }

  _checkNotificationnEnabled() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  @override
  void initState() {
    _checkNotificationnEnabled();
    super.initState();
  }

  final VisualController visualController = Get.put(VisualController());
  List<String> id = [];
  @override
  Widget build(BuildContext context) {
    final host = 'http://10.0.2.2:3000/'; //laptop
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final lstVisual = ModalRoute.of(context)!.settings.arguments as Visual;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "",
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
        // actions: [
        //   Container(
        //     margin: EdgeInsets.only(
        //       top: 16,
        //       right: 16,
        //     ),
        //     child: Stack(
        //       children: <Widget>[
        //         InkWell(onTap: () {}, child: Icon(Icons.notifications)),
        //         Positioned(
        //           right: 0,
        //           child: Container(
        //             padding: EdgeInsets.all(1),
        //             decoration: BoxDecoration(
        //               color: Colors.red,
        //               borderRadius: BorderRadius.circular(6),
        //             ),
        //             constraints: BoxConstraints(
        //               minWidth: 12,
        //               minHeight: 12,
        //             ),
        //             child: Text(
        //               '5',
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 8,
        //               ),
        //               textAlign: TextAlign.center,
        //             ),
        //           ),
        //         )
        //       ],
        //     ),
        //   )
        // ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SizedBox(
                    //   width: width * 0.14,
                    //   height: height * 0.07,
                    //   child: ElevatedButton(
                    //     onPressed: () => Navigator.pop(context),
                    //     style: ElevatedButton.styleFrom(
                    //       primary: Colors.white,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(20),
                    //       ),
                    //     ),
                    //     child: const Align(
                    //       child: Icon(
                    //         Icons.arrow_back_ios,
                    //         size: 25,
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                lstVisual.title.toString(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.01),
              SizedBox(height: height * 0.01),
              SizedBox(
                height: 340,
                child: Stack(
                  children: [
                    Container(
                      height: 400,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 10), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: 300,
                        width: double.infinity - 700,
                        child: Image.network(
                          Constant.userImageURL +
                              lstVisual.image
                                  .toString(), //Constant.userImageURL + visual.image!,
                        ),
                      ),
                      // ),SizedBox(
                      //                   width: 200,
                      //                   child: ClipRRect(
                      //                     borderRadius: BorderRadius.circular(1),
                      //                     child: Image.network(
                      //                       Constant.userImageURL +
                      //                           lstVisual.image
                      //                               .toString(), //Constant.userImageURL + visual.image!,
                      //                       fit: BoxFit.cover,
                      //                     ),
                      //                   ),
                      //                 ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              SizedBox(height: height * 0.02),
              Container(
                height: height * 0.2,
                child: Text(
                  lstVisual.description.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    InkWell(
                      child: Container(
                        height: height * 0.07,
                        width: width * 0.5,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_box,
                              color: Colors.white,
                            ),
                            SizedBox(width: width * 0.05),
                            Text(
                              'Save Post',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        AwesomeNotifications().createNotification(
                          content: NotificationContent(
                            channelKey: 'basic_channel',
                            id: 2,
                            title: lstVisual.title.toString(),
                            body: 'Successfully Saved',
                          ),
                        );
                        visualController.addVisual(lstVisual);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
