import 'dart:ui';

import 'package:bresil_burger_app_flutter/models/OrderItem.dart';
import 'package:flutter/material.dart';

class OrderDetailItem extends StatelessWidget {
  final OrderItem orderItem;
  const OrderDetailItem({Key? key, required this.orderItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white
        ),
        child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(orderItem.product!.image!, ),
                      fit: BoxFit.cover,
                  ),),
                ),
              ),
              Expanded(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:   [
                    const SizedBox(height: 5),
                     Text( orderItem.product!.name!.toUpperCase(), overflow: TextOverflow.ellipsis, style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w500,  color: Colors.black54, )),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text('${orderItem.price} FCFA', style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87
                        ),),
                      ],
                    ),
                  ],
                ),),
              Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: Center(child: Text('${orderItem.quantity}' , style: TextStyle(color: Colors.black54),))),

            ]
        )
    );
  }
}
