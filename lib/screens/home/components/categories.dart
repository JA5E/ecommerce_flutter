import 'package:ecommerce_flutter/models/Product.dart';
import 'package:ecommerce_flutter/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ecommerce_flutter/constants.dart';
import 'package:provider/provider.dart';

import 'item_category.dart';

import 'dart:convert';
import 'package:http/http.dart' as http; 

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

  class _CategoriesScreenState extends State<CategoriesScreen> {

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
  const apiUrl = 'https://moviles2-jase-default-rtdb.firebaseio.com/categories.json';

  final response = await http.get(Uri.parse(apiUrl));
  final data = json.decode(response.body);

  List<Category> fetchedCategories = [];

  for (var categoryData in data) {
    // List<Product> categoryProducts = [];
    // for (var productData in categoryData['products']) {
    //   List<Color> productColors = [];
    //   for (var color in productData['colors']) {
    //     productColors.add(Color(int.parse(color.substring(1), radix: 16)));
    //   }

    //   Product product = Product(
    //     id: productData['id'],
    //     title: productData['title'],
    //     price: productData['price'],
    //     size: productData['size'],
    //     description: productData['description'],
    //     image: productData['image'],
    //     colors: productColors,
    //   );

    //   categoryProducts.add(product);
    // }

    Category category = Category(
      title: categoryData['title'],
      image: categoryData['image'],
      //products: categoryProducts,
    );

    fetchedCategories.add(category);
  }

  // Now, you can assign the fetched data to your existing 'categories' list.
  
  final dataProvider = Provider.of<CategoriesProvider>(context, listen: false);
  dataProvider.updateCategories(fetchedCategories);
  
}


  @override
  Widget build(BuildContext context) {
    
    final dataProvider = Provider.of<CategoriesProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white70,
        elevation: 0,
        title: Text(
          'REPRESENT',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Colors.black87, // Establece el color de texto como negro
          ),
        ),
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
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
            child: GridView.builder(
              itemCount: dataProvider.categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: kDefaultPaddin,
                crossAxisSpacing: kDefaultPaddin,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) => ItemCategory(
                category: dataProvider.categories[index],
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(
                      categoryId: index,
                      category: dataProvider.categories[index]
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
