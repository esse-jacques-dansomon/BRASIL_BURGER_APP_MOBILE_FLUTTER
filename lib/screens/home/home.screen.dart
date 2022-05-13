import 'package:bresil_burger_app_flutter/components/Custom.app.bar.dart';
import 'package:bresil_burger_app_flutter/components/customNavBar.dart';
import 'package:bresil_burger_app_flutter/components/searcgBar.dart';
import 'package:bresil_burger_app_flutter/helpers/helper.dart';
import 'package:bresil_burger_app_flutter/models/Burger.dart';
import 'package:bresil_burger_app_flutter/models/product.dart';
import 'package:bresil_burger_app_flutter/screens/home/widgets/category.card.widget.dart';
import 'package:bresil_burger_app_flutter/screens/home/widgets/menu.widget.dart';
import 'package:bresil_burger_app_flutter/screens/home/widgets/popular_card.widget.dart';
import 'package:bresil_burger_app_flutter/screens/home/widgets/tile.line.wigdet.dart';
import 'package:bresil_burger_app_flutter/services/burger_service.dart';
import 'package:flutter/material.dart';

import '../../services/product_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();

}


class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Product>?> _popularProducts;
  late Future<List<Product>?> _featuredProducts;
  late Future<List<Product>?> _menuOfTheDayProducts;

  @override
  void initState() {
    super.initState();
    _popularProducts = ProductService.getPopularProducts();
    _featuredProducts = ProductService.getFeaturedProducts();
    _menuOfTheDayProducts = ProductService.getMenuOfTheDay();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: getAppBar(context),
      bottomNavigationBar: const CustomNavBar(
        home: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 20),
              // const Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 20),
              //     child: Text('Delivery to')),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: DropdownButtonHideUnderline(
              //     child: SizedBox(
              //       width: 250,
              //       child: DropdownButton(
              //         value: "Current Location",
              //         items: const [
              //           DropdownMenuItem(
              //             child: Text('Current Location'),
              //             value: "Current Location",
              //           ),
              //         ],
              //         icon: Image.asset(AppHelper.getAssetName(
              //             "dropdown_filled.png", "images/virtual")),
              //         style: AppHelper.getTheme(context).headline4,
              //         onChanged: (value) {},
              //       ),
              //     ),
              //   ),
              // ),
              const SearchBar(title: 'Search for a food'),
              //Categories
              const TitleLine(title: "Popular", route: '/offers'),
              Container(
                width: double.infinity,
                height: 135,
                padding: const EdgeInsets.only(left: 20),
                child: FutureBuilder<List<Product>?>(
                  future: _popularProducts,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return CategoryCard(
                            product: snapshot.data![index],
                          );
                        },
                      );
                    }else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
                ),
              ),

              const TitleLine(title: "Menus du jour", route: '/offers'),
              SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    FutureBuilder<List<Product>?>(
                      future: _menuOfTheDayProducts,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:snapshot.hasData?snapshot.data!.length:0,
                              itemBuilder: (context, index) {
                                return RestaurantCard(
                                  product: snapshot.data![index],
                                );
                              });
                        }else{
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }
                    )
                  ],
                ),
              ),
              //most popular

              const TitleLine(title: "Nos Promotions", route: '/offers'),
              Container(
                width: double.infinity,
                height: 270,
                padding:  EdgeInsets.only(left: 20),
                child: Expanded(
                  child: FutureBuilder<List<Product>?>(
                    future: _featuredProducts,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return PromotionCard(
                                product: snapshot.data![index],
                              );
                            }
                            );
                      }else{
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }

                ),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
