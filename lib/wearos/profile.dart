import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_second_app/app/constants.dart';
import 'package:my_second_app/data_source/remote_data_source/response/profile_response.dart';
import 'package:my_second_app/repository/user_repo.dart';
import 'package:my_second_app/wearos/login.dart';
import 'package:wear/wear.dart';

class ProfileWear extends StatefulWidget {
  const ProfileWear({super.key});

  @override
  State<ProfileWear> createState() => _ProfileWearState();
}

class _ProfileWearState extends State<ProfileWear> {
  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: ((context, shape, child) {
        return AmbientMode(
          builder: ((context, mode, child) {
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: MediaQuery.of(context).size.height * .2,
                title: const Text('Profile'),
              ),
              body: SingleChildScrollView(
                child: FutureBuilder<ProfileResponse>(
                  future: UserRepositoryImpl().userInfo(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      ProfileResponse profileResponse = snapshot.data!;
                      print(profileResponse.email);
                      return Container(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // profile image
                              GestureDetector(
                                // onTap: () async {
                                //   var source = ImageSource.gallery;
                                //   XFile image = await imagePicker.pickImage(
                                //       source: source,
                                //       imageQuality: 50,
                                //       preferredCameraDevice: CameraDevice.front);
                                //   setState(() {
                                //     UpdateProfileImage.setImage(File(image.path));
                                //   });
                                // },
                                child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                        Constant.userImageURL +
                                            profileResponse.image!,
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Center(
                                  child: Text(
                                "${profileResponse.fname!} ${profileResponse.lname!}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.black),
                              )),
                              const SizedBox(
                                height: 12,
                              ),
                              Center(
                                  child: Container(
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
                                          fontSize: 8,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Card(
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        padding: EdgeInsets.all(0),
                                        child: Column(
                                          children: <Widget>[
                                            Column(
                                              children: <Widget>[
                                                ...ListTile.divideTiles(
                                                  color: Colors.grey,
                                                  tiles: [
                                                    ListTile(
                                                      leading:
                                                          Icon(Icons.email),
                                                      title: Text(
                                                        "Email",
                                                        style: const TextStyle(
                                                          fontSize: 8,
                                                        ),
                                                      ),
                                                      subtitle: Text(
                                                        "${profileResponse.email},",
                                                        style: const TextStyle(
                                                          fontSize: 6,
                                                        ),
                                                      ),
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
                              )),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreenWear()));
                                  },
                                  child: const Text('Log Out'),
                                ),
                              ),
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
              ),
            );
          }),
        );
      }),
    );
  }
}
