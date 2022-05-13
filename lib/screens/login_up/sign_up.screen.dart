import 'dart:ui';

import 'package:bresil_burger_app_flutter/constants/colors.dart';
import 'package:bresil_burger_app_flutter/constants/constantes.dart';
import 'package:bresil_burger_app_flutter/helpers/RouterNavigator.dart';
import 'package:bresil_burger_app_flutter/helpers/helper.dart';
import 'package:bresil_burger_app_flutter/services/secure_storage_service.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../services/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscureText = true;
  bool _obscureTextConfirmedPassword = true;
  String? _password, _email, _username, _confirmPassword, _phone, _countryCode;
  late SecureStorageService secureStorageService;

  FocusNode? _passwordNode;
  FocusNode? _confirmedpasswordNode;
  FocusNode? _emailNode;
  FocusNode? _phoneNode;
  FocusNode? _usernameNode;

  @override
  void initState() {
    super.initState();
    _password='';
    _email='';
    _username='';
    _confirmPassword='';
    _phone='';
    _countryCode='';
    _usernameNode = FocusNode();
    _passwordNode = FocusNode();
    _confirmedpasswordNode = FocusNode();
    _emailNode = FocusNode();
    _phoneNode = FocusNode();
    secureStorageService = SecureStorageService();
  }

  @override
  void dispose() {
    super.dispose();
    _passwordNode?.dispose();
    _confirmedpasswordNode?.dispose();
    _emailNode?.dispose();
    _phoneNode?.dispose();
    _usernameNode?.dispose();
  }

  final _formKey = GlobalKey<FormState>();


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
                        'Creation de compte',
                        style: AppHelper.getTheme(context).headline5
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'create account',
                        style: AppHelper.getTheme(context).subtitle1
                      ),
                      const SizedBox(height: 30),
                      // Form
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            _buildUserField(),
                            const SizedBox(height: 30),
                            _buildEmailField(),
                            const SizedBox(height: 30),
                            _buildPhoneField(),
                            const SizedBox(height: 30),
                            _buildPasswordField(),
                            const SizedBox(height: 30),
                            _buildConfirmedPasswordField(),
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
                              AuthService.register(_email!, _password!, _username!, int.parse(_phone!) ).then((authInformation) {
                                if (authInformation != null) {
                                  secureStorageService.saveUser(authInformation);
                                  displayDialog(context, 'creation', 'compte créé avec succès'
                                      ' $_username,$_phone, $_email, $_password, $_countryCode');
                                  RouterNavigator.navigateTo(   context, ROUTER.homeScreen);
                                } else {
                                  displayDialog(
                                      context,
                                      'creation',
                                      'erreur lors de la création de compte');
                                }
                              });
                            }else {
                              displayDialog(context, 'Error', 'unable to create account');
                            }
                          },
                          child: const Text(
                            'CREATE ACCOUNT',
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
                    ],
                  ),
                ),
              )),
        ));
  }



  Widget _buildPasswordField(){
    return SizedBox(
      child: TextFormField(
        focusNode: _passwordNode,
        obscureText: _obscureText,
        textInputAction: TextInputAction.next,

        onEditingComplete: () {
          // Once user click on Next then it go to password field
          _confirmedpasswordNode!.requestFocus();
        },
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
  Widget _buildConfirmedPasswordField(){
    return SizedBox(
      child: TextFormField(
        focusNode: _confirmedpasswordNode,
        obscureText: _obscureTextConfirmedPassword,
        decoration:  InputDecoration(
          hintText: 'Confirmed Password',
          hintStyle: const TextStyle(color: AppColor.placeholder),

          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureTextConfirmedPassword = !_obscureTextConfirmedPassword;
              });
            },
            child: _obscureTextConfirmedPassword
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
        onSaved: (value) => _confirmPassword = value,
        validator: passwordValidator,
      ),
    );
  }
  Widget _buildEmailField(){
    return SizedBox(
      child: TextFormField(
        focusNode: _emailNode,
        onSaved: (value) => _email = value,
        validator: emailValidator,
        textInputAction: TextInputAction.next,
        onEditingComplete: () {
          // Once user click on Next then it go to password field
          _phoneNode!.requestFocus();
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
  Widget _buildPhoneField(){
    return SizedBox(
      height: 60,
      child: TextFormField(
        focusNode: _phoneNode,
        keyboardType: TextInputType.phone,
        onSaved: (value) => _phone = value,
        validator: senegalPhoneNumberValidator,
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
          hintText: 'Numero de téléphone',
          hintStyle: const TextStyle(color: AppColor.placeholder),
          prefix: SizedBox(
            height: 32,
            // For more check https://pub.dev/packages/country_code_picker
            child: CountryCodePicker(
              onChanged: (countryCode) => {
                // Save your country code
                _countryCode = countryCode.dialCode,
              },
              padding: const EdgeInsets.only(right: 0),
              textStyle: const TextStyle(color: kMainColor, fontSize: 16.5),
              initialSelection: "SN",
              showCountryOnly: false,
              searchDecoration:
              const InputDecoration(contentPadding: EdgeInsets.zero),
            ),
          ),
        ),

      ),
    );
  }
  Widget _buildUserField(){
    return SizedBox(
      child: TextFormField(
        focusNode: _usernameNode,
        onSaved: (value) => _username = value,
        validator: requiredValidator,
        textInputAction: TextInputAction.next,
        onEditingComplete: () {
          // Once user click on Next then it go to password field
          _emailNode!.requestFocus();
        },
        decoration:  InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: 'Nom Complet',
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
}