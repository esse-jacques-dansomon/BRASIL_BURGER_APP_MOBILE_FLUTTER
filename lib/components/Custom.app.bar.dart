import 'package:bresil_burger_app_flutter/constants/colors.dart';
import 'package:flutter/material.dart';

AppBar getAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    foregroundColor: AppColor.secondary,
    // title: const Text('Bresil Burger',
    //     style: TextStyle(color: AppColor.secondary, fontFamily: 'Montserrat')),
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () {
        Navigator.pushNamed(context, ROUTER.menuAppScreen);
      },
    ),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          Navigator.pushNamed(context, ROUTER.menuAppScreen);
        },
      ),
      IconButton(
        icon: const Icon(Icons.shopping_basket_outlined),
        onPressed: () {
          Navigator.pushNamed(context, ROUTER.bagScreen);
        },
      ),
    ],
  );
}
