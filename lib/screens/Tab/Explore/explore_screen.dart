import 'package:flutter_project/exports.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const AppText(
          text: "Find Products",
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SearchBarWidget(),
                const SizedBox(height: 20),
                getStaggeredGridView(context),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getStaggeredGridView(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        mainAxisExtent: 180,
      ),
      itemCount: categoryItemsDemo.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            RouteConfig.push(context, const CategoryItemsScreen());
          },
          child: Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            decoration: BoxDecoration(
              color: categoryItemsDemo[index].color?.withOpacity(0.1),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: categoryItemsDemo[index].color!.withOpacity(0.7),
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Image.asset(
                    categoryItemsDemo[index].imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
                Center(
                  child: AppText(
                    text: categoryItemsDemo[index].name,
                    textAlign: TextAlign.center,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
