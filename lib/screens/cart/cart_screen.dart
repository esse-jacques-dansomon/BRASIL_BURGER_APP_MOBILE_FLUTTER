import 'package:bresil_burger_app_flutter/constants/colors.dart';
import 'package:bresil_burger_app_flutter/helpers/RouterNavigator.dart';
import 'package:flutter/material.dart';

import '../../helpers/helper.dart';

class CartScreen extends StatelessWidget {
  @override
  const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ROUTER.homeScreen);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Mon Panier",
                    style: AppHelper.getTheme(context).headline5,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              color: AppColor.placeholderBg,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: const [
                    BurgerCard(
                      price: "16",
                      name: "Beef Burger",
                    ),
                    BurgerCard(
                      price: "14",
                      name: "Classic Burger",
                    ),
                    BurgerCard(
                      price: "17",
                      name: "Cheese Chicken Burger",
                    ),
                    BurgerCard(
                      price: "15",
                      name: "Chicken Legs Basket",
                    ),
                    BurgerCard(
                      price: "6",
                      name: "French Fries Large",
                      isLast: true,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColor.placeholder.withOpacity(0.25),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Delivery Instruction",
                            style: AppHelper.getTheme(context).headline6,
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.add,
                                  color: AppColor.orange,
                                ),
                                Text(
                                  "Add Notes",
                                  style: TextStyle(
                                    color: AppColor.orange,
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Sub Total",
                          style: AppHelper.getTheme(context).headline6,
                        ),
                      ),
                      Text(
                        "\$68",
                        style: AppHelper.getTheme(context).headline6?.copyWith(
                              color: AppColor.orange,
                            ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Delivery Cost",
                          style: AppHelper.getTheme(context).headline6,
                        ),
                      ),
                      Text(
                        "\$2",
                        style: AppHelper.getTheme(context).headline6?.copyWith(
                              color: AppColor.orange,
                            ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: AppColor.placeholder.withOpacity(0.25),
                    thickness: 1.5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Total",
                          style: AppHelper.getTheme(context).headline6,
                        ),
                      ),
                      Text("\$70")
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        RouterNavigator.navigateTo(
                            context, ROUTER.checkoutScreen);
                      },
                      child: const Text("Checkout"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BurgerCard extends StatelessWidget {
  const BurgerCard({
    Key? key,
    required String name,
    required String price,
    bool isLast = false,
  })  : _name = name,
        _price = price,
        _isLast = isLast,
        super(key: key);

  final String _name;
  final String _price;
  final bool _isLast;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: _isLast
              ? BorderSide.none
              : BorderSide(
                  color: AppColor.placeholder.withOpacity(0.25),
                ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "${_name} x1",
              style: const TextStyle(
                color: AppColor.primary,
                fontSize: 16,
              ),
            ),
          ),
          Text(
            "\$$_price",
            style: const TextStyle(
              color: AppColor.primary,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          )
        ],
      ),
    );
  }
}
