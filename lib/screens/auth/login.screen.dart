import 'dart:ui';

import 'package:bresil_burger_app_flutter/constants/colors.dart';
import 'package:bresil_burger_app_flutter/constants/constantes.dart';
import 'package:bresil_burger_app_flutter/helpers/RouterNavigator.dart';
import 'package:bresil_burger_app_flutter/helpers/helper.dart';
import 'package:bresil_burger_app_flutter/services/secure_storage_service.dart';
import 'package:flutter/material.dart';

import '../../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  String? _password, _email;
  late SecureStorageService secureStorageService;

  FocusNode? _passwordNode;

  @override
  void initState() {
    super.initState();
    _password='';
    _email='';
    _passwordNode = FocusNode();
    secureStorageService = SecureStorageService();
  }

  @override
  void dispose() {
    super.dispose();
    _passwordNode?.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  Widget _buildPasswordField(){
    return SizedBox(
      child: TextFormField(
        focusNode: _passwordNode,
        obscureText: _obscureText,
        decoration:  InputDecoration(
          hintText: 'Password',
          hintStyle: const TextStyle(color: AppColor.placeholder),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: _obscureText
                ? const Icon(Icons.visibility_off, color: kBodyTextColor)
                : const Icon(Icons.visibility, color: kBodyTextColor),
          ),
          labelStyle: const TextStyle(
              color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        onSaved: (value) => _password = value,
        validator: passwordValidator,
      ),
    );
  }

  Widget _buildEmailField(){
    return SizedBox(
      child: TextFormField(
        onSaved: (value) => _email = value,
        validator: emailValidator,
        textInputAction: TextInputAction.next,
        onEditingComplete: () {
          // Once user click on Next then it go to password field
          _passwordNode!.requestFocus();
        },
        decoration:  InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: 'Email',
          hintStyle: const TextStyle(color: AppColor.placeholder),
        ),
      ),
    );
  }


  void displayDialog(BuildContext context, String title, String text) =>
      showDialog(

        context: context,
        builder: (context) =>
            AlertDialog(
                title: Text(title, textAlign: TextAlign.center),
                content: Text(text, textAlign: TextAlign.center, ),
            ),
      );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
              height: AppHelper.getScreenHeight(context),
              width: AppHelper.getScreenWidth(context),
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 30,
                  ),
                  child: Column(
                    children: <Widget>[
                      const Spacer(flex: 2),
                      Text(
                        'Login',
                        style: AppHelper.getTheme(context).headline5,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Login to your account',
                        style: AppHelper.getTheme(context).subtitle1,
                      ),
                      const SizedBox(height: 30),
                      // Form
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            _buildEmailField(),
                            const SizedBox(height: 30),
                            _buildPasswordField(),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                      //end form
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            // RouterNavigator.navigateTo(
                            //     context, ROUTER.homeScreen);
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a Snackbar
                              _formKey.currentState!.save();
                              AuthService.login(_email!, _password!).then((authInformation) {
                                if (authInformation != null) {

                                  secureStorageService.saveUser(authInformation);
                                  displayDialog(context, 'home', 'go to home');
                                  RouterNavigator.navigateTo(
                                      context, ROUTER.homeScreen);

                                } else {
                                  displayDialog(
                                      context,
                                      'Login Failed',
                                      'Please check your email and password');
                                }
                              });

                            }else {
                              displayDialog(context, 'Error', 'Please enter valid email and password');
                            }
                          },
                          child: const Text(
                            'LOGIN',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                          onTap: () {
                            RouterNavigator.navigateTo(
                                context, ROUTER.forgotPasswordScreen);
                          },
                          child: Text('Forgot Password?',
                              style: AppHelper.getTheme(context).bodyText2)),
                      const Spacer(flex: 3),
                      const Text('Or Login with'),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              RouterNavigator.navigateTo(
                                  context, ROUTER.homeScreen);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.facebook,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                                SizedBox(width: 20),
                                Text('Login With Facebook'),
                              ],
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFF3B5998),
                                ))),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              RouterNavigator.navigateTo(
                                  context, ROUTER.homeScreen);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.gite_outlined,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                                SizedBox(width: 20),
                                Text('Login With Google'),
                              ],
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFFDB4437),
                                ))),
                      ),
                      const SizedBox(height: 50),
                      GestureDetector(
                        onTap: () {
                          RouterNavigator.navigateTo(
                              context, ROUTER.signupScreen);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Don\'t have an account? '),
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                color: AppColor.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                ),
              )),
        ));
  }
}