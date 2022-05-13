import 'package:bresil_burger_app_flutter/helpers/RouterNavigator.dart';
import 'package:bresil_burger_app_flutter/screens/auth/widgets/custom_text_input.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../helpers//helper.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
                      'Forgot Password',
                      style: AppHelper.getTheme(context).headline5,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Enter your email address and we will send you a link to reset your password.',
                      style: AppHelper.getTheme(context).subtitle1,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    CustomTextInput(
                      hintText: "Your Email",
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          RouterNavigator.navigateTo(
                              context, ROUTER.homeScreen);
                        },
                        child: Text(
                          'Send',
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    GestureDetector(
                      onTap: () {
                        RouterNavigator.navigateTo(
                            context, ROUTER.signinScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Have you an account? ',
                              style: TextStyle(fontSize: 18)),
                          Text(
                            'Sign in',
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
            )));
  }
}
