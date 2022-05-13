import 'package:bresil_burger_app_flutter/components/Custom.app.bar.dart';
import 'package:bresil_burger_app_flutter/components/customNavBar.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../helpers/helper.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({Key? key}) : super(key: key);

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      bottomNavigationBar: const CustomNavBar(more: true),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Adresse de livraison'),
                const SizedBox(height: 12),
                Row(
                  children: [
                    SizedBox(
                      width: AppHelper.getScreenWidth(context) * 0.4,
                      child: Text(
                        'Medina Rue 3, Casablanca Dakar',
                        style: AppHelper.getTheme(context).headline6?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 19,
                            color: Colors.black),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 20,
            width: double.infinity,
            color: AppColor.placeholderBg,
          ),
        ],
      )),
    );
  }
}
