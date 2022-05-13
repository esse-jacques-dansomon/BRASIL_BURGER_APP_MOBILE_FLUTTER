import 'package:bresil_burger_app_flutter/constants/colors.dart';
import 'package:bresil_burger_app_flutter/helpers/RouterNavigator.dart';
import 'package:bresil_burger_app_flutter/helpers/helper.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: AppHelper.getScreenHeight(context),
      width: AppHelper.getScreenWidth(context),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ClipPath(
              clipper: CusTomClipperAppBar(),
              child: Container(
                width: double.infinity,
                height: AppHelper.getScreenHeight(context) * 0.5,
                decoration: ShapeDecoration(
                  color: AppColor.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(AppHelper.getAssetName("Logo.png", "images")),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: AppHelper.getScreenHeight(context) * 0.3,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Flexible(
                    child: Text(
                      "Le lorem ipsum est, en imprimerie, une suite de mo"
                      "ts sans signification utilisée à titre provisoire pour",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        //navigation to login page
                        RouterNavigator.navigateTo(
                            context, ROUTER.signinScreen);
                      },
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(color: AppColor.placeholder),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        //navigation to sign page
                        RouterNavigator.navigateTo(
                            context, ROUTER.signupScreen);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.orange),
                        shape: MaterialStateProperty.all(
                          const StadiumBorder(
                            side:
                                BorderSide(color: AppColor.orange, width: 1.5),
                          ),
                        ),
                      ),
                      child: const Text('CREATE AN ACCOUNT'),
                    ),
                  ),
                  const Spacer()
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class CusTomClipperAppBar extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldeClipper) {
    return true;
  }

  @override
  Path getClip(Size size) {
    Offset controlPoint = Offset(size.width * 0.24, size.height);
    Offset endpoint = Offset(size.width * 0.25, size.height * 0.96);
    Offset controlPoint2 = Offset(size.width * 0.3, size.height * 0.78);
    Offset endpoint2 = Offset(size.width * 0.5, size.height * 0.77);
    Offset controlPoint3 = Offset(size.width * 0.7, size.height * 0.78);
    Offset endpoint3 = Offset(size.width * 0.75, size.height * 0.96);

    Offset controlPoint4 = Offset(size.width * 0.76, size.height);
    Offset endpoint4 = Offset(size.width * 0.79, size.height);
    Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.height * 0.21, size.height)
      ..quadraticBezierTo(
        controlPoint.dx,
        controlPoint.dy,
        endpoint.dx,
        endpoint.dy,
      )
      ..quadraticBezierTo(
        controlPoint2.dx,
        controlPoint2.dy,
        endpoint2.dx,
        endpoint2.dy,
      )
      ..quadraticBezierTo(
        controlPoint3.dx,
        controlPoint3.dy,
        endpoint3.dx,
        endpoint3.dy,
      )
      ..quadraticBezierTo(
        controlPoint4.dx,
        controlPoint4.dy,
        endpoint4.dx,
        endpoint4.dy,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0);
    return path;
  }
}
