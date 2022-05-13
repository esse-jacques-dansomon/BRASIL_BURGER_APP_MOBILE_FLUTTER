import 'package:bresil_burger_app_flutter/components/Custom.app.bar.dart';
import 'package:bresil_burger_app_flutter/components/custom.input.form.dart';
import 'package:bresil_burger_app_flutter/components/customNavBar.dart';
import 'package:bresil_burger_app_flutter/constants/colors.dart';
import 'package:bresil_burger_app_flutter/helpers/RouterNavigator.dart';
import 'package:bresil_burger_app_flutter/helpers/helper.dart';
import 'package:bresil_burger_app_flutter/models/User.dart';
import 'package:bresil_burger_app_flutter/services/secure_storage_service.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  iniState()  {
    super.initState();

  }
  Widget build(BuildContext context) {
    var token = SecureStorageService.getUser();


    return Scaffold(
      appBar: getAppBar(context),
      bottomNavigationBar: const CustomNavBar(profile: true),
      body: SingleChildScrollView(
        child: FutureBuilder<User?>(
            future: token,
            builder: (context, snapshot) {


              if (snapshot.hasData) {
                return Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      ClipOval(
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.asset(
                                AppHelper.getAssetName(
                                  "user.jpg",
                                  "images/real",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 8,
                              child: Container(
                                height: 20,
                                width: 80,
                                color: Colors.black.withOpacity(0.3),
                                child: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.edit,
                            color: AppColor.orange,
                            size: 18,
                          ),
                          Text('Edit Profile',
                              style: TextStyle(color: AppColor.orange, fontSize: 17)),
                        ],
                      ),
                      const SizedBox(height: 8),
                       Text('Salut, ${snapshot.data!.username}',
                          style: TextStyle(
                              fontSize: 21,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () {
                          storage.deleteAll();
                          RouterNavigator.navigateTo(context, ROUTER.landingScreen);
                        },
                        child: const Text('Se Deconnecter',
                            style:
                            TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                      ),
                      Column(children:  [
                        CustomFormInput(label: 'Name', value: snapshot.data!.username!),
                          CustomFormInput(
                            label: 'Email', value: snapshot.data!.email!),
                        CustomFormInput(label: 'Telephone', value: snapshot.data!.phone!),
                        const CustomFormInput(
                            label: 'Password', value: '****', isPassword: true),
                        const CustomFormInput(
                            label: 'Confirmed Password',
                            value: '****',
                            isPassword: true),
                      ]),
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Editer',
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                );
              }
            }),

      ),

    );
  }
}
