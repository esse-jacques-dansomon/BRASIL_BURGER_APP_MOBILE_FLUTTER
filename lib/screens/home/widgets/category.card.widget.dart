
import 'package:bresil_burger_app_flutter/constants/colors.dart';
import 'package:bresil_burger_app_flutter/helpers/helper.dart';
import 'package:bresil_burger_app_flutter/models/product.dart';
import 'package:bresil_burger_app_flutter/screens/product/product_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required product,
  }) : _product = product,
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
      child: SizedBox(
        height: 125,
        width: 125,
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 120,
                  height: 100,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Image.network(
                    _product.image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                _product.name!,
                style: AppHelper.getTheme(context).headline5?.copyWith(
                  color: AppColor.primary, fontSize: 17,fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),


      ),);
  }

}
