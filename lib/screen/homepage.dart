import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var imagesList = [
    "https://i.pinimg.com/originals/cc/18/...",
    "https://cdn.pixabay.com/photo/2015/04...",
    "https://encrypted-tbn0.gstatic.com/im...",
    "https://cdn.pixabay.com/photo/2013/07...",
    "https://thumbs.dreamstime.com/b/pictu...",
    "https://images.pexels.com/photos/2063...",
    "https://i.pinimg.com/originals/4c/52/...",
    "https://coolhdwall.com/storage1/20210..."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: MasonryGridView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                      "https://source.unsplash.com/random?sig=$index"),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
