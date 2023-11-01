import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ecommerce_flutter/constants.dart';
import 'package:ecommerce_flutter/models/Product.dart';

import 'components/add_to_cart.dart';
import 'components/color_and_size.dart';
import 'components/counter_with_fav_btn.dart';
import 'components/description.dart';
import 'components/product_title_with_image.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product, this.img});

  final Product product;
  final String? img;

  @override
  Widget build(BuildContext context) {
    //final Size size = MediaQuery.of(context).size;
    return Scaffold(
      // each product have a color
      //backgroundColor: Color(0xFA0F0707),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white70,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            //colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'REPRESENT',
          style: TextStyle(
            color: Colors.black87, // Establece el color de texto como negro
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/heart.svg",
              colorFilter: ColorFilter.mode(Colors.black87, BlendMode.srcIn),
            ),
            onPressed: () {},
          ),
          SizedBox(width: kDefaultPaddin / 2)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              //height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    //margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      left: kDefaultPaddin,
                      right: kDefaultPaddin,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        ProductTitleWithImage(product: product, img: img),
                        SizedBox(height: kDefaultPaddin),
                        ColorAndSize(product: product),
                        SizedBox(height: kDefaultPaddin / 2),
                        CounterWithFavBtn(),
                        SizedBox(height: kDefaultPaddin / 2),
                        Description(product: product),
                        SizedBox(height: kDefaultPaddin / 2),
                        AddToCart(product: product)
                      ],
                    ),
                  ),
                  //ProductTitleWithImage(product: product)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
