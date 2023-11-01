import 'dart:convert';
import 'package:http/http.dart' as http; 

import 'package:flutter/material.dart';

/*
Future<void> _fetchData() async {
  const apiUrl = 'https://moviles2-jase-default-rtdb.firebaseio.com/categories.json';

  final response = await http.get(Uri.parse(apiUrl));
  final data = json.decode(response.body);

  List<Category> fetchedCategories = [];

  for (var categoryData in data) {
    List<Product> categoryProducts = [];
    for (var productData in categoryData['products']) {
      List<Color> productColors = [];
      for (var color in productData['colors']) {
        productColors.add(Color(int.parse(color.substring(1), radix: 16)));
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
    }

    Category category = Category(
      title: categoryData['title'],
      image: categoryData['image'],
      products: categoryProducts,
    );

    fetchedCategories.add(category);
  }

  // Now, you can assign the fetched data to your existing 'categories' list.
  categories = fetchedCategories;
}
*/

class CategoriesProvider with ChangeNotifier {
  List<Category> categories = [];

  void updateCategories(List<Category> newCategories) {
    categories = newCategories;
    notifyListeners();
  }
}

class ProductsProvider with ChangeNotifier {
  List<Product> products = [];
  void updateProducts(List<Product> newProdcuts) {
    products = newProdcuts;
    notifyListeners();
  }

}

class Product {
  final String image, title, description;
  final int price, size, id;
  final List<String> colors;

  Product(
      {required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.size,
      required this.id,
      required this.colors,
      });
}

class Category {
  final String image, title;
  //final List<Product> products;

  Category(
      {required this.image,
      required this.title,
      //required this.products,
      });
}


/*
List<Product> tennis_products = [
  Product(
      id: 1,
      title: "Tennis 1",
      price: 100,
      size: 26,
      description: dummyText,
      image: "assets/images/tennis_1_black.png",
      colors: [Colors.black,Colors.blue,Colors.green]
  ),
  Product(
      id: 2,
      title: "Tennis 2",
      price: 150,
      size: 26,
      description: dummyText,
      image: "assets/images/tennis_2_black.png",
      colors: [Colors.black,Colors.blue,Colors.green]
  ),
  Product(
      id: 3,
      title: "Tennis 3",
      price: 300,
      size: 26,
      description: dummyText,
      image: "assets/images/tennis_3_black.png",
      colors: [Colors.black,Colors.blue,Colors.green]
  ),
  Product(
      id: 4,
      title: "Tennis 4",
      price: 200,
      size: 26,
      description: dummyText,
      image: "assets/images/tennis_4_black.png",
      colors: [Colors.black,Colors.blue,Colors.green]
  )
];

List<Product> clothes_products = [
  Product(
      id: 1,
      title: "Clothes 1",
      price: 150,
      size: 26,
      description: dummyText,
      image: "assets/images/clothes_1_black.png",
      colors: [Colors.black,Colors.red,Colors.yellow]
  ),
  Product(
      id: 2,
      title: "Clothes 2",
      price: 100,
      size: 26,
      description: dummyText,
      image: "assets/images/clothes_2_red.png",
      colors: [Colors.black,Colors.red,Colors.yellow]
  ),
  Product(
      id: 3,
      title: "Clothes 3",
      price: 200,
      size: 26,
      description: dummyText,
      image: "assets/images/clothes_3_yellow.png",
      colors: [Colors.black,Colors.red,Colors.yellow]
  ),
];

List<Category> categories = [
  Category(
      title: "TENNIS",
      image: "assets/images/tennis.png",
      products: tennis_products,
  ),
  Category(
      title: "CLOTHES",
      image: "assets/images/clothes.png",
      products: clothes_products,
  ),
];


String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";


*/