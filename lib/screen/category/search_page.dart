import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_second_app/repository/category_repo.dart';
import 'package:my_second_app/screen/category/category_screen.dart';
import 'package:my_second_app/screen/dashboard.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const String route = "searchScreen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search",
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
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, DashboardScreen.route);
                    },
                    child: Image.asset('asset/icons/mylogo.png',
                        height: 30, color: Color.fromARGB(255, 196, 191, 191))),
                // Positioned(
                //   right: 0,
                //   child: Container(
                //     padding: EdgeInsets.all(1),
                //     decoration: BoxDecoration(
                //       color: Colors.red,
                //       borderRadius: BorderRadius.circular(6),
                //     ),
                //     constraints: BoxConstraints(
                //       minWidth: 12,
                //       minHeight: 12,
                //     ),
                //     child: Text(
                //       '5',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 8,
                //       ),
                //       textAlign: TextAlign.center,
                //     ),
                //   ),
                // )
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              const Text(
                textAlign: TextAlign.center,
                'Category',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const DisplayCategory(),
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayCategory extends StatelessWidget {
  const DisplayCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      color: Colors.grey[200],
      child: FutureBuilder(
        future: CategoryRepositoryImpl().getAllCategory(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.count(
              childAspectRatio: 3 / 2,
              crossAxisCount: 2,
              children: [
                //Get data from snapshot
                for (var category in snapshot.data!)
                  InkWell(
                    splashColor: Colors.red,
                    onTap: () {
                      Navigator.pushNamed(context, CategoryVisualScreen.route,
                          arguments: category);
                    },
                    child: Card(
                      child: Container(
                        decoration: new BoxDecoration(
                          gradient: new LinearGradient(
                              colors: [
                                Theme.of(context).primaryColor.withOpacity(0.6),
                                Theme.of(context).accentColor.withOpacity(0.4),
                              ],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            category.categoryName,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
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
