import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/constants/constants.dart';
import 'package:flutter_project/models/product_model.dart';
import 'package:flutter_project/widgets/app_button.dart';
import 'package:flutter_project/widgets/app_text.dart';
import 'package:flutter_project/widgets/expandable_widget.dart';
import 'package:flutter_project/widgets/favourite_icon.dart';
import 'package:flutter_project/widgets/item_counter_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product grocery;

  const ProductDetailsScreen({Key? key, required this.grocery})
      : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int amount = 1;
  bool isProductExpanded = false;
  bool isNutritionExpanded = false;
  bool isReviewExpanded = false;

  double getTotalPrice() => amount * (widget.grocery.price ?? 0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              _HeaderPart(widget: widget),
              ListTile(
                contentPadding: const EdgeInsets.all(20),
                title: AppText(
                  text: widget.grocery.name,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: AppText(
                  text: widget.grocery.description ?? '',
                  fontSize: 14,
                  color: const Color(0xFFF3603F),
                ),
                trailing: const AnimatedFavoriteIcon(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ItemCounterWidget(
                  price: widget.grocery.price ?? 0.0,
                  onChanged: (value) {
                    amount = value;
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Divider(height: 0),
              ExpandedWidget(
                label: "Product Details",
                description: lorem,
                isExpanded: isProductExpanded,
                onTap: () {
                  isProductExpanded = !isProductExpanded;
                  setState(() {});
                },
              ),
              const Divider(height: 0),
              ExpandedWidget(
                label: "Nutritions",
                isExpanded: isNutritionExpanded,
                onTap: () {
                  isNutritionExpanded = !isNutritionExpanded;
                  setState(() {});
                },
                description: lorem,
                trailing: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color(0xffEBEBEB),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const AppText(
                    text: "100gm",
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Color(0xff7C7C7C),
                  ),
                ),
              ),
              const Divider(height: 0),
              ExpandedWidget(
                label: "Review",
                isExpanded: isReviewExpanded,
                description: lorem,
                trailing: Row(
                  children: [
                    ...List.generate(
                      5,
                      (index) => const Icon(
                        Icons.star,
                        color: Color(0xffF3603F),
                        size: 20,
                      ),
                    )
                  ],
                ),
                onTap: () {
                  isReviewExpanded = !isReviewExpanded;
                  setState(() {});
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: AppButton(
                  label: "Add To Basket",
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderPart extends StatelessWidget {
  final ProductDetailsScreen widget;

  const _HeaderPart({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(25.0),
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: Color(0xFFF2F3F2),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(CupertinoIcons.chevron_left),
              ),
              const Spacer(),
              const Icon(CupertinoIcons.square_arrow_up)
            ],
          ),
          Expanded(
            child: Hero(
              tag: "Grocery: ${widget.grocery.name}",
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white30,
                      blurRadius: 30,
                      spreadRadius: 20,
                    ),
                  ],
                ),
                child: Image(
                  image: AssetImage(widget.grocery.imagePath),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
