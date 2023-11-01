import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/models/Product.dart';

import '../../../../constants.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({super.key, required this.category, required this.press});

  final Category category;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              //padding: EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(16),
              ),
              //child: Hero(tag: "${category.title}",child: Image.asset(category.image, fit: BoxFit.cover,),),
              child: Stack(
                  children: [
                    Image.asset(category.image, fit: BoxFit.cover),
                    Center(
                      child: Text(
                        "${category.title}", // Replace with the desired text
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
            ),
          ),
        ],
      ),
    );
  }
}
