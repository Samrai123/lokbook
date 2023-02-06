import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:my_second_app/model/category.dart';
import 'package:my_second_app/model/user.dart';
import 'package:my_second_app/repository/category_repo.dart';
import 'package:my_second_app/repository/user_repo.dart';
import 'package:my_second_app/screen/Widget/theme_helper.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});
  static const String route = "postScreen";

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Category> _lstCategorySelected = [];
  _showUserCategory() async {
    List<User> lstUser = await UserRepositoryImpl().getUser();
    for (User u in lstUser) {
      debugPrint(u.fname);
      for (Category c in u.category) {
        debugPrint(c.categoryName);
      }
    }
  }

  Widget _displayImage() {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.grey[300],
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          builder: (context) => Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    _browseImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text('Camera'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    _browseImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.image),
                  label: const Text('Gallery'),
                )
              ],
            ),
          ),
        );
      },
      child: SizedBox(
        height: 300,
        width: double.infinity - 500,
        child: _img == null
            ? Image.asset(
                'asset/images/post_image.jpg',
              )
            : Image.file(_img!),
      ),
    );
  }

  File? _img;
  Future _browseImage(ImageSource imageSource) async {
    try {
      // Source is either Gallary or Camera
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          _img = File(image.path);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        alignment: Alignment.center,
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          _displayImage(),
          const SizedBox(height: 30),
          Container(
            decoration: ThemeHelper().inputBoxDecorationShaddow(),
            child: TextFormField(
              minLines: 3,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              // obscureText: true,
              decoration: ThemeHelper()
                  .textInputDecoration('Description', 'Enter your Description'),
              // controller: _passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter description';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          FutureBuilder(
            future: CategoryRepositoryImpl().getAllCategory(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MultiSelectDialogField(
                  //initialValue: [snapshot.data![0]],
                  title: const Text('Select Category'),
                  items: snapshot.data!
                      .map((category) => MultiSelectItem(
                            category,
                            category.categoryName,
                          ))
                      .toList(),
                  listType: MultiSelectListType.CHIP,
                  buttonText: const Text('Select category'),
                  buttonIcon: const Icon(Icons.search),
                  onConfirm: (values) {
                    _lstCategorySelected = values;
                  },
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  validator: ((value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select Category';
                    }
                    return null;
                  }),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 350,
            child: Container(
              decoration: ThemeHelper().buttonBoxDecoration(context),
              child: ElevatedButton(
                style: ThemeHelper().buttonStyle(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Text(
                    'Post'.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                onPressed: () {},
              ),
            ),
          )
        ]),
      ),
    );
  }
}
