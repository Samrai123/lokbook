import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_second_app/app/constants.dart';
import 'package:my_second_app/model/visual.dart';

class VisualScreen extends StatefulWidget {
  const VisualScreen({super.key});
  static const String route = "visualScreen";
  @override
  State<VisualScreen> createState() => _VisualScreenState();
}

class _VisualScreenState extends State<VisualScreen> {
  List<String> id = [];
  @override
  Widget build(BuildContext context) {
    final host = 'http://10.0.2.2:3000/'; //laptop
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final lstVisual = ModalRoute.of(context)!.settings.arguments as Visual;
    return Scaffold(
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
                    SizedBox(
                      width: width * 0.14,
                      height: height * 0.07,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Align(
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.14,
                      height: height * 0.07,
                      child: ElevatedButton(
                        onPressed: () {
                          // AwesomeNotifications().createNotification(
                          //   content: NotificationContent(
                          //     channelKey: 'Basic',
                          //     id: 1,
                          //     title: lstProduct.name.toString(),
                          //     body: 'Successfully Added to Favourite',
                          //   ),
                          // );

                          // createBox();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Icon(
                          Icons.favorite_outlined,
                          size: 25,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                lstVisual.description.toString(),
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
                      // children: [
                      //   const Text(
                      //     'Price',
                      //     style: TextStyle(
                      //       fontSize: 20,
                      //       fontWeight: FontWeight.normal,
                      //     ),
                      //   ),
                      //   Text(
                      //     'Rs ${lstProduct.price}',
                      //     style: const TextStyle(
                      //       fontSize: 24,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ],
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
                              'Add to Cart',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        // cartController.addProduct(lstProduct);
                        // AwesomeNotifications().createNotification(
                        //   content: NotificationContent(
                        //     channelKey: 'Basic',
                        //     id: 1,
                        //     title: lstProduct.name.toString(),
                        //     body: 'Successfully Added to Cart',
                        //   ),
                        // );
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
