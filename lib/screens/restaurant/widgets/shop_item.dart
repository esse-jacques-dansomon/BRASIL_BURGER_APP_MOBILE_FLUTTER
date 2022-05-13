

import 'package:bresil_burger_app_flutter/models/product.dart';
import 'package:bresil_burger_app_flutter/screens/product/product_detail_screen.dart';
import 'package:flutter/material.dart';

class ShopItem extends StatelessWidget {
  final Product product;
   const ShopItem({
    Key? key,required this.product }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 10.0),
            height: 180.0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image:  DecorationImage(
                    image: Image.network(product.image!).image,
                    fit: BoxFit.cover,
                  )
              ),
            ),),
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(product.name!,
              style: const TextStyle(fontSize: 17.0,
                  fontWeight: FontWeight.bold, color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Text('10,000.0 FCFA', style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),)

        ],
      ),
    );
  }
}
