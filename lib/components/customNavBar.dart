import 'package:bresil_burger_app_flutter/helpers/RouterNavigator.dart';
import 'package:bresil_burger_app_flutter/helpers/helper.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomNavBar extends StatelessWidget {
  final bool home;
  final bool menu;
  final bool offer;
  final bool profile;
  final bool more;

  const CustomNavBar(
      {Key? key,
      this.home = false,
      this.menu = false,
      this.offer = false,
      this.profile = false,
      this.more = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: AppHelper.getScreenWidth(context),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: CustomNavBarClipper(),
              child: Container(
                height: 80,
                width: AppHelper.getScreenWidth(context),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBottomBarItem(
                      activeImage: AppHelper.getAssetName(
                          'more_filled.png', 'images/virtual'),
                      image:
                          AppHelper.getAssetName('more.png', 'images/virtual'),
                      title: 'Menu',
                      route: ROUTER.menuAppScreen,
                      item: menu,
                    ),
                    CustomBottomBarItem(
                      activeImage: AppHelper.getAssetName(
                          'menu_filled.png', 'images/virtual'),
                      image:
                          AppHelper.getAssetName('menu.png', 'images/virtual'),
                      title: 'Plats',
                      route: ROUTER.offersScreen,
                      item: offer,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomBottomBarItem(
                      activeImage: AppHelper.getAssetName(
                          'user_filled.png', 'images/virtual'),
                      image:
                          AppHelper.getAssetName('user.png', 'images/virtual'),
                      title: 'Profile',
                      route: ROUTER.profileScreen,
                      item: profile,
                    ),
                    CustomBottomBarItem(
                      activeImage: AppHelper.getAssetName(
                          'bag_filled.png', 'images/virtual'),
                      image:
                          AppHelper.getAssetName('bag.png', 'images/virtual'),
                      title: 'Orders',
                      route: ROUTER.myOrdersScreen,
                      item: more,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 60,
              width: 70,
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: home ? AppColor.orange : AppColor.placeholder,
                onPressed: () {
                  if (!home) {
                    RouterNavigator.navigateTo(context, ROUTER.homeScreen);
                  }
                },
                child: Image.asset(
                    AppHelper.getAssetName("home_white.png", "images/virtual")),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomBottomBarItem extends StatelessWidget {
  const CustomBottomBarItem({
    Key? key,
    required this.item,
    required this.route,
    required this.title,
    required this.image,
    required this.activeImage,
  }) : super(key: key);

  final bool item;
  final String route;
  final String title;
  final String image;
  final String activeImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!item) {
          RouterNavigator.navigateTo(context, route);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          item ? Image.asset(activeImage) : Image.asset(image),
          item
              ? Text(title, style: const TextStyle(color: AppColor.orange))
              : Text(title),
        ],
      ),
    );
  }
}

class CustomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.3, 0);
    path.quadraticBezierTo(
      size.width * 0.375,
      0,
      size.width * 0.375,
      size.height * 0.1,
    );
    path.cubicTo(
      size.width * 0.4,
      size.height * 0.9,
      size.width * 0.6,
      size.height * 0.9,
      size.width * 0.625,
      size.height * 0.1,
    );
    path.quadraticBezierTo(
      size.width * 0.625,
      0,
      size.width * 0.7,
      0.1,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
