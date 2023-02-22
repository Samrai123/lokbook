import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_second_app/app/constants.dart';
import 'package:my_second_app/model/category.dart';
import 'package:my_second_app/model/visual.dart';
import 'package:my_second_app/repository/visual_repo.dart';

class CategoryVisualScreen extends StatefulWidget {
  const CategoryVisualScreen({super.key});
  static const String route = "categoryVisualsScreen";
  @override
  State<CategoryVisualScreen> createState() => _CategoryVisualScreenState();
}

class _CategoryVisualScreenState extends State<CategoryVisualScreen> {
  late Category category;
  @override
  void didChangeDependencies() {
    category = ModalRoute.of(context)!.settings.arguments as Category;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: VisualRepsitoryImpl().getVisualByCategory(category.categoryId),
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
        ));
  }
}
