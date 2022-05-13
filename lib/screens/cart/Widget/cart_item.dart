import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:flutter_cart/model/cart_model.dart';
var cart = FlutterCart();

class CartItemNew extends StatefulWidget {
  CartItem cartItem;
  CartItemNew({Key? key, required this.cartItem}) : super(key: key);
  @override
  State<CartItemNew> createState() => _CartItemNewState();
}


class _CartItemNewState extends State<CartItemNew> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  '${widget.cartItem.productDetails.image}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    '${widget.cartItem.productName}',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${widget.cartItem.productDetails.description}',
                    style: const TextStyle(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${widget.cartItem.unitPrice} FCFA',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      cart.incrementItemToCart(cart.findItemIndexFromCart(widget.cartItem.productId)!);
                    });
                  },
                ),
                Container(
                  height: 30,
                  width: 40,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      "${widget.cartItem.quantity}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (widget.cartItem.quantity > 1) {
                      setState(() {
                        cart.decrementItemFromCart(cart.findItemIndexFromCart(widget.cartItem.productId)!);
                      });
                    }
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
