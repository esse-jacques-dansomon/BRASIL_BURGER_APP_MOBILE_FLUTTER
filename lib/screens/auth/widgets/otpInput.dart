import 'package:bresil_burger_app_flutter/constants/colors.dart';
import 'package:flutter/material.dart';

class OtpInput extends StatefulWidget {
  const OtpInput({Key? key}) : super(key: key);

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: ShapeDecoration(
        color: AppColor.placeholderBg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Stack(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 10, left: 20),
            child: Text(
              "*",
              style: TextStyle(fontSize: 45),
            ),
          ),
          TextField(
            decoration: InputDecoration(border: InputBorder.none),
          )
        ],
      ),
    );
  }
}
