import 'package:flutter/cupertino.dart';
import 'package:flutter_project/exports.dart';

class CategoryItemsScreen extends StatelessWidget {
  const CategoryItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                    constraints: const BoxConstraints(
                      maxHeight: 100,
                      maxWidth: 100,
                    ),
                    splashRadius: 20,
                    icon: const Icon(CupertinoIcons.chevron_left),
                  ),
                  const AppText(
                    text: "Beverages",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  const Icon(CupertinoIcons.square_arrow_up)
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 230,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: beverages.length,
                      itemBuilder: (context, index) {
                        final _beverages = beverages[index];
                        return GestureDetector(
                          onTap: () {
                            RouteConfig.push(
                              context,
                              ProductDetailsScreen(grocery: _beverages),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: ProductCard(item: _beverages),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
