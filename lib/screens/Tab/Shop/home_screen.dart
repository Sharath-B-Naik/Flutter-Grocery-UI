import 'package:flutter/material.dart';
import 'package:flutter_project/config/route_config.dart';
import 'package:flutter_project/constants/image_constants.dart';
import 'package:flutter_project/data.dart';
import 'package:flutter_project/models/product_model.dart';
import 'package:flutter_project/screens/Tab/Shop/grocery_featured_item_widget.dart';
import 'package:flutter_project/screens/Tab/Shop/product_details_screen.dart';
import 'package:flutter_project/utils/app_colors.dart';
import 'package:flutter_project/widgets/app_text.dart';
import 'package:flutter_project/widgets/product_card.dart';
import 'package:flutter_project/widgets/heading_and_trailing_button.dart';
import 'package:flutter_project/widgets/search_bar_widget.dart';
import 'package:flutter_svg/svg.dart';

// Extenstion to simplify the code
extension on List<Product> {
  Widget toListView() {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        itemCount: length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCard(
            item: this[index],
            onCardTap: () {
              RouteConfig.push(
                context,
                ProductDetailsScreen(grocery: this[index]),
              );
            },
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 20),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  SvgPicture.asset(Images.appIconSVG),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Images.locationSVG),
                      const SizedBox(width: 8),
                      const AppText(text: "Dhaka,Bonassre")
                    ],
                  ),
                  const SizedBox(height: 15),
                  const SearchBarWidget(),
                  const SizedBox(height: 25),
                  Container(
                    width: 500,
                    height: 115,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        image: AssetImage(
                          Images.bannerbackgroundPNG,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Image.asset(Images.bannerPNG),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              FittedBox(
                                child: AppText(
                                  text: "Fresh Vegetables",
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              FittedBox(
                                child: AppText(
                                  text: "Get Up To 40%  OFF",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20)
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  const HeadingTrailingButtton(heading: "Exclusive Order"),
                  exclusiveOffers.toListView(),
                  const SizedBox(height: 15),
                  const HeadingTrailingButtton(heading: "Best Selling"),
                  bestSelling.toListView(),
                  const SizedBox(height: 15),
                  const HeadingTrailingButtton(heading: "Groceries"),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 105,
                    child: ListView.separated(
                      itemCount: groceryFeaturedItems.length,
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, __) => const SizedBox(width: 20),
                      itemBuilder: (context, index) {
                        return GroceryFeaturedCard(
                          item: groceryFeaturedItems[index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  groceries.toListView(),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
