import 'package:bresil_burger_app_flutter/models/Order.dart';
import 'package:bresil_burger_app_flutter/screens/order/widgets/order_detail_page.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final Order order;
  const OrderItem({Key? key, o, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            isScrollControlled: true,
            isDismissible: true,
            context: context,
            builder: (context) {
              return OrderDetailPage(order: order);
            });
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 120,
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
                  child: Image.network(order.orderItems!.last.product!.image!, fit: BoxFit.cover,),
                ),
            Expanded(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:   [
                  Text('Ref No WAN78${order.id}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 10),
                  Text('ID : ${order.id}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Text('${order.orderItems!.length} items'),
                      Text('${order.status}'),
                    ],
                  ),
                ],
              ),)
          ]
        )
      ),
    );
  }
}
