import 'package:bresil_burger_app_flutter/models/Order.dart';
import 'package:flutter/material.dart';
import 'order_detail_item.dart';

class OrderDetailPage extends StatelessWidget {
  final Order order;
  const OrderDetailPage({Key? key, required this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration:  BoxDecoration(color: Colors.white24 ),
        child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios), onPressed: () { Navigator.pop(context); },
              ),
            ],
          ),
          const Divider( height: 5, color: Colors.grey, thickness: 1,),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 15, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:   [
                const Text('Order Ref', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Colors.black),),
                Text('(#${order.id})', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Colors.black),),
              ]
            ),

          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.62,
            child: Expanded(
              child: ListView.builder(
                  itemCount: order.orderItems!.length,
                  itemBuilder: (context, index){
                    return OrderDetailItem(orderItem: order.orderItems![index]);
                  }),
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 15.0, right: 15, left: 15, bottom: 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:   [
                  const Text('Total', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Colors.black),),
                  Text('${order.total} FCFA', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color:Colors.black),),
                ]
            ),

          ),

        ]
    ),
    );
  }
}
