import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_second_app/app/constants.dart';
import 'package:my_second_app/data_source/remote_data_source/response/visual_response.dart';
import 'package:my_second_app/model/visual.dart';
import 'package:my_second_app/repository/visual_repo.dart';
import 'package:my_second_app/screen/visual/visual_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String route = "homeScreen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "For You",
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
      body: FutureBuilder<List<Visual>>(
        future: VisualRepsitoryImpl().getVisual(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final visuals = snapshot.data as List<Visual>;
            return MasonryGridView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
              itemCount: visuals.length,
              itemBuilder: (context, index) {
                return DisplayVisualWidget(visuals[index]);
              },
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

class DisplayVisualWidget extends StatelessWidget {
  final Visual visual;
  const DisplayVisualWidget(this.visual, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, VisualScreen.route, arguments: visual);
          },
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  Constant.userImageURL + visual.image!,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Text("${visual.description}"),
              ),
            ],
          ),
        ));
  }
}
