import 'package:flutter/material.dart';
import 'package:flutter_project/models/product_model.dart';
import 'package:flutter_project/widgets/app_text.dart';

class GroceryFeaturedCard extends StatelessWidget {
  final Product item;
  const GroceryFeaturedCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 105,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 17),
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Image(image: AssetImage(item.imagePath)),
          const SizedBox(width: 15),
          AppText(
            text: item.name,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )
        ],
      ),
    );
  }
}
