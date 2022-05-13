import 'package:bresil_burger_app_flutter/components/Custom.app.bar.dart';
import 'package:bresil_burger_app_flutter/models/product.dart';
import 'package:bresil_burger_app_flutter/screens/restaurant/widgets/shop_item.dart';
import 'package:bresil_burger_app_flutter/services/burger_service.dart';
import 'package:bresil_burger_app_flutter/services/complement_service.dart';
import 'package:bresil_burger_app_flutter/services/menu_service.dart';
import 'package:bresil_burger_app_flutter/services/product_service.dart';
import 'package:flutter/material.dart';


class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);
  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final data = [
    ProductService.getProducts(),
    BurgerService.getBurgers(),
    ProductService.getMenus(),
    ProductService.getComplements(),
  ];

  iniSatate(){
  super.initState();
  }

  int _selectedIndex = 0;
  List<String> categories = [
    'All',
    'Burgers',
    'menus',
    'complements'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(context),
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Restaurant', style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 26.0,
                        color: Colors.black
                    )),
                    const SizedBox(height: 15.0),
                    SizedBox(
                        height: 40,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return CategoryProductItem(index);
                            }
                        )
                    ),
                    const SizedBox(height: 10.0),
                    Expanded (
                        child: FutureBuilder<List<Product>?>(
                          future: data[_selectedIndex],
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                             return GridView.builder(
                                itemCount: snapshot.hasData? snapshot.data!.length :0,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.75,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                ),
                                itemBuilder: (context, index) {
                                  return  ShopItem(
                                      product: snapshot.data![index]

                                  );
                                },
                              );
                            }else
                              {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                          }
                        )
                    ),
                  ]
              ),
            ))
    );
  }

  Container CategoryProductItem(int index,) {
    return Container(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;

          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _selectedIndex == index ? Colors.red : Colors.grey,


          ),
          height: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(

                child: Container(
                    height: 35,
                    width: 35,
                    child: Image.asset('assets/images/burger.png', fit: BoxFit.cover,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),)
                ),
              ),
              SizedBox(width: 10,),
              Text(categories[index], style:  TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                color:_selectedIndex==index ? Colors.white : Colors.white,

              ),),

            ],

          ),),
      ),
    );
  }

}



