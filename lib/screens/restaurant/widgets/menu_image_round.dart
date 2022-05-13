import 'package:flutter/material.dart';

import '../../../helpers/helper.dart';

class MenuAppImage extends StatelessWidget {
  const MenuAppImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Align(
        alignment: Alignment.centerLeft,
        child: ClipOval(
          child: SizedBox(
            height: 60,
            width: 60,
            child: Image.asset(
                AppHelper.getAssetName("western.png", "images/real"),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
