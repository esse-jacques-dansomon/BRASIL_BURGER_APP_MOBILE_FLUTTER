import 'package:bresil_burger_app_flutter/constants/colors.dart';
import 'package:bresil_burger_app_flutter/helpers/helper.dart';
import 'package:bresil_burger_app_flutter/models/product.dart';
import 'package:bresil_burger_app_flutter/screens/product/product_detail_screen.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    Key? key,
    required Product product,
  })  :
        _product = product,
        super(key: key);

  final Product _product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ProductDetailScreen(product: _product),
        )
        );
      },
      child: SizedBox(
        height: 270,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 200, width: double.infinity, child: Image.network(
              _product.image!,
              fit: BoxFit.cover,
            )),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        _product.name!,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                      ),)
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AppHelper.getAssetName(
                            "star_filled.png", "images/virtual"),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "4.9",
                        style: TextStyle(
                          color: AppColor.orange,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("(124 ratings)"),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("Cafe"),
                      const SizedBox(
                        width: 5,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          ".",
                          style: TextStyle(
                            color: AppColor.orange,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("Western Food"),
                    ],
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
