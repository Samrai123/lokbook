import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:my_second_app/app/user_permisson.dart';
import 'package:my_second_app/model/category.dart';
import 'package:my_second_app/model/user.dart';
import 'package:my_second_app/repository/category_repo.dart';
import 'package:my_second_app/repository/user_repo.dart';
import 'package:my_second_app/screen/Widget/snackbar.dart';
import 'package:my_second_app/screen/auth1/login.dart';

import '../Widget/header_widge.dart';
import '../Widget/theme_helper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String route = "registerScreen";
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();

    checkPermission();
  }

  // void show() {
  //   showSnackbar(context, 'Token : ${Constant.token}', Colors.yellow);
  // }

  checkPermission() async {
    await UserPermission.checkCameraPermission();
  }

  List<Category> _lstCategorySelected = [];
  final _formKey = GlobalKey<FormState>();
  final _fnameController = TextEditingController(text: 'Sam');
  final _lnameController = TextEditingController(text: 'Rai');
  final _usernameController = TextEditingController(text: 'samrai');
  final _passwordController = TextEditingController(text: 'samrai123');
  final _emailController = TextEditingController(text: 'samrai@gmail.com');

  _saveUser() async {
    User user = User(
      fname: _fnameController.text,
      lname: _lnameController.text,
      email: _emailController.text,
      username: _usernameController.text,
      password: _passwordController.text,
    );

    user.category.addAll(_lstCategorySelected);

    int status = await UserRepositoryImpl().addAllUser(_img, user);
    _showMessage(status);
  }

  _goToAnotherPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  _showMessage(int status) {
    if (status > 0) {
      _goToAnotherPage();
      showSnackbar(context, 'User Successfully Added',
          Color.fromARGB(255, 117, 244, 54));
    } else {
      showSnackbar(context, 'Failed to Add User', Colors.red);
    }
  }

  _showUserCategory() async {
    List<User> lstUser = await UserRepositoryImpl().getUser();
    for (User u in lstUser) {
      debugPrint(u.fname);
      for (Category c in u.category) {
        debugPrint(c.categoryName);
      }
    }
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

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left,
                  color: Color.fromARGB(255, 255, 247, 247)),
            ),
            Text('Back',
                style: GoogleFonts.comicNeue(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 255, 247, 247)))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: const HeaderWidget(
                  150, false, Icons.person_add_alt_1_rounded),
            ),
            Positioned(top: 40, left: -1, child: _backButton()),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                            height: 140,
                            width: double.infinity - 500,
                            child: _img == null
                                ? Image.asset(
                                    'asset/icons/user.png',
                                  )
                                : Image.file(_img!),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _fnameController,
                            key: const Key('txtFname'),
                            decoration: ThemeHelper().textInputDecoration(
                                'First Name', 'Enter your first name'),
                            validator: ((value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter first name';
                              }
                              return null;
                            }),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _lnameController,
                            key: const Key('txtLname'),
                            decoration: ThemeHelper().textInputDecoration(
                                'Last Name', 'Enter your last name'),
                            validator: ((value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Last name';
                              }
                              return null;
                            }),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _emailController,
                            decoration: ThemeHelper().textInputDecoration(
                                "E-mail address", "Enter your email"),
                            key: const Key('txtEmail'),
                            keyboardType: TextInputType.emailAddress,
                            validator: ((value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter email';
                              }
                              return null;
                            }),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _usernameController,
                            key: const Key('txtUsername'),
                            decoration: ThemeHelper().textInputDecoration(
                                'Username', 'Enter your username'),
                            validator: ((value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter username';
                              }
                              return null;
                            }),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _passwordController,
                            key: const Key('txtPassword'),
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                "Password*", "Enter your password"),
                            validator: ((value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            }),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        // FutureBuilder(
                        //   future: CategoryRepositoryImpl().getAllCategory(),
                        //   builder: (context, snapshot) {
                        //     if (snapshot.hasData) {
                        //       return MultiSelectDialogField(
                        //         //initialValue: [snapshot.data![0]],
                        //         title: const Text('Select Category'),
                        //         items: snapshot.data!
                        //             .map((category) => MultiSelectItem(
                        //                   category,
                        //                   category.categoryName,
                        //                 ))
                        //             .toList(),
                        //         listType: MultiSelectListType.CHIP,
                        //         buttonText: const Text('Select category'),
                        //         buttonIcon: const Icon(Icons.search),
                        //         onConfirm: (values) {
                        //           _lstCategorySelected = values;
                        //         },
                        //         decoration: BoxDecoration(
                        //           border: Border.all(
                        //             color: Colors.grey,
                        //             width: 1,
                        //           ),
                        //           borderRadius: BorderRadius.circular(50),
                        //         ),
                        //         validator: ((value) {
                        //           if (value == null || value.isEmpty) {
                        //             return 'Please select Category';
                        //           }
                        //           return null;
                        //         }),
                        //       );
                        //     } else {
                        //       return const Center(
                        //         child: CircularProgressIndicator(),
                        //       );
                        //     }
                        //   },
                        // ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            key: const Key('btnRegister'),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _saveUser();
                              }
                            },
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Register".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.pushReplacement(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => LoginScreen()));
                        //   },
                        //   child: const Text(
                        //     "Already have a Account.",
                        //     style: TextStyle(color: Colors.grey),
                        //   ),
                        // ),
                        const SizedBox(height: 25.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
