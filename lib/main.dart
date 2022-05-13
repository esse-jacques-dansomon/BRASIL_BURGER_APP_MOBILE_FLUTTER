import 'dart:convert';
import 'package:bresil_burger_app_flutter/constants/colors.dart';
import 'package:bresil_burger_app_flutter/screens/auth/forgot.password.screen.dart';
import 'package:bresil_burger_app_flutter/screens/auth/login.screen.dart';
import 'package:bresil_burger_app_flutter/screens/auth/optScreen.dart';
import 'package:bresil_burger_app_flutter/screens/cart/cart_screen_new.dart';
import 'package:bresil_burger_app_flutter/screens/checkout/chekout.screen.dart';
import 'package:bresil_burger_app_flutter/screens/home/home.screen.dart';
import 'package:bresil_burger_app_flutter/screens/login_up/sign_up.screen.dart';
import 'package:bresil_burger_app_flutter/screens/order/order_screen.dart';
import 'package:bresil_burger_app_flutter/screens/profile/profile.dart';
import 'package:bresil_burger_app_flutter/screens/restaurant/menu.app.screen.dart';
import 'package:bresil_burger_app_flutter/screens/restaurant/shop.dart';
import 'package:bresil_burger_app_flutter/screens/start_screens/landing.screen.dart';
import 'package:bresil_burger_app_flutter/screens/start_screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

Future<String> get jwtOrEmpty async {
  var jwt = await storage.read(key: "ACCESS");
  if(jwt == null) return "";
  return jwt;
}

Widget isLoggedIn(){

  return FutureBuilder(
      future: jwtOrEmpty,
      builder: (context, snapshot) {
        //affichage du widget en fonction de la connexion
        if(!snapshot.hasData) return const CircularProgressIndicator();
        //si on a un token
        if(snapshot.data != "") {
          var str = snapshot.data;
          //conversion du jwt en tableau
          var jwt = str.toString().split(".");
          //verifie si c'est un jwt valide
          if(jwt.length !=3) {
            storage.deleteAll();
            return const LoginScreen();
          } else {

            var payload = json.decode(ascii.decode(base64.decode(base64.normalize(jwt[1]))));
            //si le token est valide on affiche le home
            if(DateTime.fromMillisecondsSinceEpoch(payload["exp"]*1000).isAfter(DateTime.now())) {
              storage.deleteAll();
              return const HomeScreen();
              //sinon on affiche le login
            } else {
              return const LoginScreen();
            }
          }
          //si on n'a pas de token on affiche le start page
        } else {
          //deleteAll();
          return const SplashScreen();
        }
      }
  );
}

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'BERGER BRASIL',
      initialRoute: '/',
      home: isLoggedIn(),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: AppColor.secondary),
          bodyText1: TextStyle(color: AppColor.secondary),
          subtitle1: TextStyle(color: AppColor.secondary),
          headline1: TextStyle(color: AppColor.primary, fontSize: 25.0),
          headline5: TextStyle(color: AppColor.primary, fontSize: 25.0),
          headline4: TextStyle(color: AppColor.secondary, fontSize: 20.0),
          headline6: TextStyle(color: AppColor.primary, fontSize: 25.0),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(AppColor.orange)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColor.orange),
              shape: MaterialStateProperty.all(const StadiumBorder()),
              elevation: MaterialStateProperty.all(2)),
        ),
      ),
      routes: {
        ROUTER.landingScreen: (context) => const LandingScreen(),
        ROUTER.signinScreen: (context) => const LoginScreen(),
        ROUTER.signupScreen: (context) => const SignUpScreen(),
        ROUTER.forgotPasswordScreen: (context) => const ForgotPasswordScreen(),
        ROUTER.otpScreen: (context) => const OTPScreen(),
        ROUTER.homeScreen: (context) => const HomeScreen(),
        ROUTER.profileScreen: (context) => const ProfileScreen(),
        ROUTER.offersScreen: (context) => const ShopScreen(),
        ROUTER.bagScreen: (context) => const CartScreenNew(),
        ROUTER.checkoutScreen: (context) => const CheckoutScreen(),
        ROUTER.menuAppScreen: (context) => const MenuAppScreen(),
        ROUTER.myOrdersScreen: (context) => const MyOrdersScreen(),

      },
    );
  }
}