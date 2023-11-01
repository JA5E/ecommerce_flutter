import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/models/Product.dart';

import '../../../constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({super.key, required this.product, this.img});
  
  final Product product;
  final String? img;
  
  @override
  Widget build(BuildContext context) {

    final String imgP;
    if(img==null){
      imgP = product.image;
    }else{
      imgP = img!;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 40),
          ),
          SizedBox(height: kDefaultPaddin),
          Expanded(
            child: Container(
              child: Image.asset(
                imgP,
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
