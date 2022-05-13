
import 'package:bresil_burger_app_flutter/components/dialog_widget.dart';
import 'package:bresil_burger_app_flutter/constants/colors.dart';
import 'package:bresil_burger_app_flutter/helpers/RouterNavigator.dart';
import 'package:bresil_burger_app_flutter/screens/checkout/widgets/add.payment.widget.dart';
import 'package:bresil_burger_app_flutter/screens/checkout/widgets/order.procced.dart';
import 'package:bresil_burger_app_flutter/screens/checkout/widgets/payment.card.widget.dart';
import 'package:bresil_burger_app_flutter/services/cartService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';

import '../../helpers/helper.dart';
import '../../services/order_service.dart';
var cart = new FlutterCart();

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      RouterNavigator.navigateTo(context, ROUTER.bagScreen);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Checkout",
                      style: AppHelper.getTheme(context).headline5,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Delivery Address"),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: AppHelper.getScreenWidth(context) * 0.4,
                      child: const Text(
                        "653 Nostrand Ave., Brooklyn, NY 11216",
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        //TODO : add edit address screen
                      },
                      child: const Text(
                        "Change",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 10,
                width: double.infinity,
                color: AppColor.placeholderBg,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Payment method"),
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            isScrollControlled: true,
                            isDismissible: false,
                            context: context,
                            builder: (context) {
                              return const AddPaymentCard();
                            });
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.add),
                          Text(
                            "Add Card",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              PaymentCard(
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Cash on delivery"),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(
                          side: BorderSide(color: AppColor.orange),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              PaymentCard(
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                          child: Image.asset(
                            AppHelper.getAssetName(
                              "visa2.png",
                              "images/real",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("**** **** **** 2187"),
                      ],
                    ),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(
                          side: BorderSide(color: AppColor.orange),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              PaymentCard(
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                          height: 30,
                          child: Image.asset(
                            AppHelper.getAssetName(
                              "paypal.png",
                              "images/real",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("johndoe@email.com"),
                      ],
                    ),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(
                          side: BorderSide(color: AppColor.orange),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 10,
                width: double.infinity,
                color: AppColor.placeholderBg,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text("Sub Total", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16,)),
                        Text(
                          "${cart.getTotalAmount()} FCFA",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18,)
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Discount"),
                        Text(
                          "000",
                        )
                      ],
                    ),
                    Divider(
                      height: 40,
                      color: AppColor.placeholder.withOpacity(0.25),
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text("Total", style:  TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                        Text(
                          "${cart.getTotalAmount()} FCFA",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                height: 10,
                width: double.infinity,
                color: AppColor.placeholderBg,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                  // TODO : Add payment logic ORDER
                      var e = OrderService.makeOrder();
                      e.then((order) {
                        if (order?.client!=null) {
                          cart.deleteAllCart();
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              isScrollControlled: true,
                              isDismissible: false,
                              context: context,
                              builder: (context) {
                                return  OrderProcessed(order: order!,);
                              });
                        }
                        else{
                          AppDialogWidget.displayDialog(context, "Commande", "Error lorgement de la commande");
                        }
                      });
                    },
                    child: const Text("Commander"),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
