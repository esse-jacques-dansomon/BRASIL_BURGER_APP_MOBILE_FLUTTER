import 'package:flutter/cupertino.dart';

class RouterNavigator {
  static navigateTo(BuildContext context, String Router) {
    return Navigator.pushNamed(
      context,
      Router,
    );
  }
}
