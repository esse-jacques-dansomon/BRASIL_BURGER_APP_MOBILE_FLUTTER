import 'package:bresil_burger_app_flutter/screens/auth/widgets/otpInput.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../helpers/RouterNavigator.dart';
import '../../helpers/helper.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: AppHelper.getScreenWidth(context),
        height: AppHelper.getScreenHeight(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 30,
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 50),
                Text(
                  'we sent you an OTP',
                  style: AppHelper.getTheme(context).headline5,
                ),
                const SizedBox(height: 40),
                Text(
                  'please enter the OTP',
                  style: AppHelper.getTheme(context).subtitle1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    OtpInput(),
                    OtpInput(),
                    OtpInput(),
                    OtpInput(),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Next',
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    RouterNavigator.navigateTo(context, ROUTER.signinScreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Did\t receive ?', style: TextStyle(fontSize: 18)),
                      Text(
                        ' Click Here',
                        style: TextStyle(
                          color: AppColor.orange,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
