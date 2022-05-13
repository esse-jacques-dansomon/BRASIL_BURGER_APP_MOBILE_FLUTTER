import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductRecommande extends StatelessWidget {
  const ProductRecommande({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
        color: Colors.black,
        margin: const EdgeInsets.all(8),
        child: Column(
            children: [
              Container(
                  height: 110,
                  decoration:  const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/burger.png'),
                      fit: BoxFit.cover,
                    ),
                  )
              ),

              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Burger Italien ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '5,000.0 FCFA',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print('add to cart');
                          },
                          child: Icon(
                            Icons.shopping_basket_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              )
            ]
        )
    );
  }
}
