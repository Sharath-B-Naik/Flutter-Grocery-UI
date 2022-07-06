import 'package:flutter/rendering.dart';

class Product {
  final int id;
  final String name;
  final String imagePath;
  final String? description;
  final double? price;
  final Color? color;

  Product({
    required this.id,
    required this.name,
    required this.imagePath,
    this.description,
    this.price = 0.0,
    this.color,
  });
}
