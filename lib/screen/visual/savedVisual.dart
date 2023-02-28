import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:my_second_app/app/constants.dart';
import 'package:my_second_app/app/controller.dart';
import 'package:my_second_app/model/visual.dart';

class SavedVisual extends StatelessWidget {
  final VisualController controller = Get.find();

  SavedVisual({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Saved Visual",
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
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: MasonryGridView.builder(
              itemCount: controller.visual.length,
              itemBuilder: (BuildContext context, int index) {
                return SavedVisualScreen(
                  controller: controller,
                  visual: controller.visual.keys.toList()[index],
                  index: index,
                );
              },
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
            ),
          ),
        ),
      ),
    );
  }
}

class SavedVisualScreen extends StatelessWidget {
  final VisualController controller;
  final Visual visual;
  final int index;
  var size, height, width;

  SavedVisualScreen(
      {Key? key,
      required this.controller,
      required this.visual,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 0, top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(Constant.userImageURL + visual.image.toString()),

          // SizedBox(width: width * 0.1),
          SizedBox(
            height: 60,
            width: 100,
            child: Text(
              visual.title.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // SizedBox(width: width * 0.2),
          // IconButton(
          //     onPressed: () {
          //       controller.removeVisual(visual);
          //     },
          //     icon: Icon(
          //       Icons.remove_circle,
          //       size: 30,
          //       color: Colors.red,
          //     )),

          // IconButton(
          //   onPressed: () {
          //     controller.addVisual(visual);
          //   },
          //   icon: Icon(
          //     Icons.add_circle,
          //     size: 30,
          //     color: Colors.green,
          //   ),
          // ),
        ],
      ),
    );
  }
}
