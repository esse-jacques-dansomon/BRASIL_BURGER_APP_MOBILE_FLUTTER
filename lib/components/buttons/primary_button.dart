import 'dart:io';

import 'package:bresil_burger_app_flutter/constants/constantes.dart';
import 'package:bresil_burger_app_flutter/helpers/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';



class PrimaryButton extends StatelessWidget {
  final String text;
  final GestureTapCallback press;

  const PrimaryButton({Key? key, required this.text, required this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    EdgeInsets verticalPadding =
    EdgeInsets.symmetric(vertical: AppHelper.getScreenHeight(context) * 0.02);
    return SizedBox(
      width: double.infinity,
      child: Platform.isIOS
          ? CupertinoButton(
        padding: verticalPadding,
        color: AppColor.secondary,
        onPressed: press,
        child: buildText(context),
      )
          : ElevatedButton(
        style: TextButton.styleFrom(
          padding: verticalPadding,
          backgroundColor: AppColor.primary,
        ),
        onPressed: press,
        child: buildText(context),
      ),
    );
  }

  Text buildText(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: kButtonTextStyle,
    );
  }
}
