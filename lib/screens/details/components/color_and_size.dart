import 'package:ecommerce_flutter/screens/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/models/Product.dart';

import '../../../constants.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    // Define a list of colors
    List<Color> colors = [Color(0xFF7C4141), Color(0xFF41627C), Color(0xFF7C7C41)];
    List<String> paths = [];
    for (var i in product.colors)
      paths.add(i);
    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("COLOR"),
              SizedBox(width: kDefaultPaddin / 2),
              for (var i = 0; i < product.colors.length; i++)
                ColorDot(
                  color: colors[i],
                  isSelected: true, // You can set isSelected based on your logic
                  onTap: 
                    () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        product:  product,
                        img: paths[i],
                      ),
                    ),
                  )
                ),
            ],
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: kTextColor),
              children: [
                TextSpan(text: "\n"),
                TextSpan(
                  text: "",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class ColorDot extends StatelessWidget {
  const ColorDot({
    super.key,
    required this.color,
    required this.isSelected,
    required this.onTap
    
  });

  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Define la acción que se realizará al tocar el ColorDot.
      child: Container(
        margin: EdgeInsets.only(
          top: kDefaultPaddin / 4,
          right: kDefaultPaddin / 2,
        ),
        padding: EdgeInsets.all(2.5),
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? color : Colors.transparent,
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

