import 'package:bresil_burger_app_flutter/constants/colors.dart';
import 'package:bresil_burger_app_flutter/helpers/helper.dart';
import 'package:bresil_burger_app_flutter/models/product.dart';
import 'package:bresil_burger_app_flutter/screens/product/product_detail_screen.dart';
import 'package:flutter/material.dart';

class PromotionCard extends StatelessWidget {
  const PromotionCard({
    Key? key,
    required Product product, promotion,
  })  : _product = product,
        super(key: key);
  final Product _product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ProductDetailScreen(product: _product),
        )
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 300,
                height: 200,
                child: Image.network(
                  _product.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _product.name!,
              style: AppHelper.getTheme(context)
                  .headline4
                  ?.copyWith(color: AppColor.primary),
            ),
            Row(
              children: [
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
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  AppHelper.getAssetName("star_filled.png", "images/virtual"),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "4.9",
                  style: TextStyle(
                    color: AppColor.orange,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
