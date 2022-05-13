import 'package:bresil_burger_app_flutter/models/Order.dart';
import 'package:bresil_burger_app_flutter/models/OrderItem.dart';
import 'package:flutter_cart/flutter_cart.dart';
var cart = FlutterCart();

class CartService {

  var cartItems = cart.cartItem;
   Order createOrder()  {
    var totalPrice = cart.getTotalAmount();
    Order order = Order( total: totalPrice, moreInformation: "je suis hype",  );
    order.orderItems = [];
    cartItems.forEach((item) {
        var orderItem = OrderItem(
            price: item.unitPrice,
            quantity: item.quantity,
            product_id: item.productId,
          total: item.unitPrice * item.quantity,
        );
        order.orderItems?.add(orderItem);
        //print(orderItem.toJson());
    });
    //print(order.toJson());
    return order;
  }

}