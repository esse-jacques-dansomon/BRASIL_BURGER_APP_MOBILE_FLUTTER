import 'package:bresil_burger_app_flutter/models/Order.dart';
import 'package:bresil_burger_app_flutter/screens/order/widgets/order_item.dart';
import 'package:bresil_burger_app_flutter/services/order_service.dart';
import 'package:flutter/material.dart';
import '../../components/customNavBar.dart';
class MyOrdersScreen extends StatelessWidget {

  const MyOrdersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    var  _orderItems = OrderService.getOrderByClient();
    print(_orderItems);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: const CustomNavBar(
        more: true,
      ),
      appBar: AppBar(
        title: const Text('Orders'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag),
            onPressed: () {},
          ),
        ],
      ),
      body : SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
              children:  <Widget>[
                FutureBuilder<List<Order>>(
                  future: _orderItems,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                          return OrderItem(order: snapshot.data![index]);
                        }
                      );
                    }else{
                      return const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),

                        ),
                      );
                    }
                  }


                )
              ]
          ),),
      ),
    );
  }
}
