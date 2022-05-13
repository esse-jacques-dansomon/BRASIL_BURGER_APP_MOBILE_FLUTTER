import 'package:bresil_burger_app_flutter/constants/colors.dart';
import 'package:bresil_burger_app_flutter/helpers/RouterNavigator.dart';
import 'package:bresil_burger_app_flutter/screens/cart/Widget/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import '../../components/dialog_widget.dart';
final cart = FlutterCart();
class CartScreenNew extends StatefulWidget {
  const CartScreenNew({Key? key}) : super(key: key);

  @override
  State<CartScreenNew> createState() => _CartScreenNewState();
}

class _CartScreenNewState extends State<CartScreenNew> {

  @override
  Widget build(BuildContext context) {
    var total = cart.getTotalAmount();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text('Panier'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 80,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
               Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  '$total FCFA',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80),
                    ),
                    color: AppColor.orange,
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        if (cart.getTotalAmount() > 0) {
                          RouterNavigator.navigateTo(
                              context, ROUTER.checkoutScreen);
                        }else
                          {
                            AppDialogWidget.displayDialog(context, 'Panier Vide', 'Aucun article dans le panier');
                          }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.shopping_basket_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              'Checkout',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
                ListView.builder(
                  itemCount: cart.getCartItemCount(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index)
                  {
                    return CartItemNew(
                      cartItem: cart.cartItem[index],
                    );
                  },

                )


  ]
        ),
      ),
    );
  }
}
