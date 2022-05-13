import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../helpers/helper.dart';

class SearchBar extends StatelessWidget {
  final String title;
  const SearchBar({Key? key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          color: AppColor.placeholderBg,
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Image.asset(
              AppHelper.getAssetName("search_filled.png", "images/virtual"),
            ),
            hintText: title,
            hintStyle: const TextStyle(
              color: AppColor.placeholder,
              fontSize: 18,
            ),
            contentPadding: const EdgeInsets.only(
              top: 12.5,
            ),
          ),
        ),
      ),
    );
  }
}
