import 'package:bresil_burger_app_flutter/constants/colors.dart';
import 'package:bresil_burger_app_flutter/helpers/RouterNavigator.dart';
import 'package:bresil_burger_app_flutter/helpers/helper.dart';
import 'package:bresil_burger_app_flutter/models/Order.dart';
import 'package:flutter/material.dart';

class OrderProcessed extends StatelessWidget {
  final Order order;
  const OrderProcessed({
    Key? key, required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppHelper.getScreenHeight(context) * 0.8,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.clear),
              ),
            ],
          ),
          Image.asset(
            AppHelper.getAssetName(
              "vector4.png",
              "images/virtual",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Thank You!",
            style: TextStyle(
              color: AppColor.primary,
              fontWeight: FontWeight.w900,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "for your order",
            style: AppHelper.getTheme(context)
                .headline4
                ?.copyWith(color: AppColor.primary),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
                "Your order is now being processed. We will let you know once the order is picked from the outlet. Check the status of your order"),
          ),
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //TODO NAVIFATE TO TRACK ORDER PAGE
                },
                child: Text("Track My Order ${order.id}"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: TextButton(
              onPressed: () {
                RouterNavigator.navigateTo(context, ROUTER.homeScreen);
              },
              child: const Text(
                "Back To Home",
                style: TextStyle(
                  color: AppColor.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
