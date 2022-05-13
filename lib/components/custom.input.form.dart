import 'package:bresil_burger_app_flutter/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomFormInput extends StatelessWidget {
  const CustomFormInput({
    Key? key,
    required String label,
    required String value,
    bool isPassword = false,
  })  : _label = label,
        _value = value,
        _isPassword = isPassword,
        super(key: key);

  final String _label;
  final String _value;
  final bool _isPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        width: double.infinity,
        height: 55,
        padding: const EdgeInsets.only(left: 40),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          color: AppColor.placeholderBg,
        ),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: _label,
            contentPadding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
          ),
          obscureText: _isPassword,
          initialValue: _value,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
