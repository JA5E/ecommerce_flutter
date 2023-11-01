import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ecommerce_flutter/constants.dart';
import 'package:provider/provider.dart';

import '../../models/Product.dart';
import '../details/details_screen.dart';
import 'components/item_card.dart';

import 'dart:convert';
import 'package:http/http.dart' as http; 
//
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.categoryId, required this.category});
  
  final Category category;
  final int categoryId;
  _HomeScreenState createState() => _HomeScreenState();
}

  class _HomeScreenState extends State<HomeScreen> {
  

  @override
  void initState() {
    super.initState();
    _fetchProducts(widget.categoryId);
  }

  Future<void> _fetchProducts(int number) async {
  //String index = number.toString();
  String apiUrl = 'https://moviles2-jase-default-rtdb.firebaseio.com/categories/$number.json';

  final response = await http.get(Uri.parse(apiUrl));
  final data = json.decode(response.body);

    List<Product> categoryProducts = [];
    for (var productData in data['products']) {
       List<String> productColors = [];
        for (var color in productData['colors']) {
          productColors.add(color);
        }

      Product product = Product(
        id: productData['id'],
        title: productData['title'],
        price: productData['price'],
        size: productData['size'],
        description: productData['description'],
        image: productData['image'],
        colors: productColors,
      );

      categoryProducts.add(product);
      print(product.colors);
    }

    final dataProvider = Provider.of<ProductsProvider>(context, listen: false);
    dataProvider.updateProducts(categoryProducts);

  }

  @override
  Widget build(BuildContext context) {

      final dataProvider = Provider.of<ProductsProvider>(context, listen: true);


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.category.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black87, // Establece el color de texto como negro
          ),
        ),
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: () => Navigator.pop(context)
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              colorFilter: ColorFilter.mode(kTextColor, BlendMode.srcIn),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              colorFilter: ColorFilter.mode(kTextColor, BlendMode.srcIn),
            ),
            onPressed: () {},
          ),
          SizedBox(width: kDefaultPaddin / 2)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: GridView.builder(
                itemCount: dataProvider.products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                  product:  dataProvider.products[index],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        product:  dataProvider.products[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
