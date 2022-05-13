import 'package:bresil_burger_app_flutter/constants/colors.dart';
import 'package:bresil_burger_app_flutter/helpers/RouterNavigator.dart';
import 'package:bresil_burger_app_flutter/helpers/helper.dart';
import 'package:bresil_burger_app_flutter/models/product.dart';
import 'package:bresil_burger_app_flutter/screens/product/widgets/product_recommande_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
final cart = FlutterCart();

class ProductDetailScreenNew extends StatefulWidget {
  final  Product product  ;
  const ProductDetailScreenNew({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailScreenNew> createState() => _ProductDetailScreenNewState();
}

class _ProductDetailScreenNewState extends State<ProductDetailScreenNew> {
  var quantity = 1;
  @override
  Widget build(BuildContext context) {
    var totalPrice = widget.product.price! * quantity;
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 80,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "$totalPrice  FCFA",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80),
                    ),
                    color: AppColor.orange,
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        RouterNavigator.navigateTo(context, ROUTER.cartScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            const Icon(
                              Icons.shopping_basket_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            GestureDetector(
                              onTap: (){
                                cart.addToCart(
                                  productId: widget.product.id,
                                  unitPrice: widget.product.price,
                                  quantity: quantity,
                                  productName: widget.product.name,
                                  productDetailsObject: widget.product,
                                  uniqueCheck: widget.product.id,
                                );
                              },
                              child: const Text(
                                'Add to Cart',
                                style:
                                TextStyle(fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: AppHelper.getScreenHeight(context) * 0.5,
                      width: AppHelper.getScreenWidth(context),
                      child: Image.network(
                        widget.product.image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: AppHelper.getScreenHeight(context) * 0.5,
                      width: AppHelper.getScreenWidth(context),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.0, 0.4],
                          colors: [
                            Colors.black.withOpacity(0.9),
                            Colors.black.withOpacity(0.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                RouterNavigator.navigateTo(
                                    context, ROUTER.cartScreen);
                              },
                              child: const Icon(
                                Icons.shopping_basket_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppHelper.getScreenHeight(context) * 0.35,
                      ),
                      SizedBox(
                        height: AppHelper.getScreenHeight(context) * 0.6,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Container(
                                height: 700,
                                width: double.infinity,
                                padding:
                                const EdgeInsets.symmetric(vertical: 30),
                                decoration: const ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40),
                                    ),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text(
                                        widget.product.name!,
                                        style: AppHelper.getTheme(context)
                                            .headline5,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      child: Text(
                                        "Description",
                                        style: AppHelper.getTheme(context)
                                            .headline4
                                            ?.copyWith(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 20),
                                      child: Text(
                                          widget.product.description!),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 20),
                                      child: Divider(
                                        color: AppColor.placeholder,
                                        thickness: 1.5,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text(
                                        "Produits Récommandés",
                                        style: AppHelper.getTheme(context)
                                            .headline4
                                            ?.copyWith(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    //TODO Releated products
                                    SizedBox(
                                      height: 170,
                                      child: Expanded(

                                        child: ListView.builder(
                                            itemCount: 20,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index){
                                              return   const ProductRecommande();

                                            }),

                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        children: [
                                          const Text(
                                            'Quantity',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              children: [
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                      elevation:
                                                      MaterialStateProperty
                                                          .all(5.0)),
                                                  onPressed: () {
                                                    setState(() {
                                                      if (quantity > 1) {
                                                        quantity--;
                                                      }
                                                    }); },
                                                  child: const Text('-'),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  height: 35,
                                                  width: 55,
                                                  decoration:
                                                  const ShapeDecoration(
                                                    shape: StadiumBorder(
                                                      side: BorderSide(
                                                          color:
                                                          AppColor.orange),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children:  [
                                                      Text(
                                                        //TODO
                                                        "$quantity",
                                                        style: const TextStyle(
                                                          color:
                                                          AppColor.orange,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                      elevation:
                                                      MaterialStateProperty
                                                          .all(5.0)),
                                                  onPressed: () {
                                                    setState(() {
                                                      quantity++;
                                                    });
                                                  },
                                                  child: const Text("+"),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
