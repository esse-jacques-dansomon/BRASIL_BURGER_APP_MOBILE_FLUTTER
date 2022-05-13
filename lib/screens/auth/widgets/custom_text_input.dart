import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class CustomTextInput extends StatefulWidget {
  CustomTextInput({
    Key? key,
    required hintText,
    EdgeInsets? padding,
  })  : _hintText = hintText,
        super(key: key);
  final String _hintText;

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColor.placeholderBg,
      ),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget._hintText,
            hintStyle: const TextStyle(color: AppColor.placeholder),
            contentPadding: const EdgeInsets.only(left: 40)),
      ),
    );
  }
}
