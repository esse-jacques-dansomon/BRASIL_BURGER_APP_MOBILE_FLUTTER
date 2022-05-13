import 'dart:async';

import 'package:bresil_burger_app_flutter/helpers/helper.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  initState() {
    _timer = Timer(const Duration(milliseconds: 6000), () {
      //navigate to the next screen
      Navigator.pushReplacementNamed(context, '/landingScreen');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: AppHelper.getScreenWidth(context),
          height: AppHelper.getScreenHeight(context),
          child: Stack(
            children: [
              const SizedBox(
                width: double.infinity,
                height: double.infinity,
              ),
              Align(
                alignment: Alignment.center,
                child:
                    Image.asset(AppHelper.getAssetName("Logo.png", "images")),
              )
            ],
          )),
    );
  }
}
