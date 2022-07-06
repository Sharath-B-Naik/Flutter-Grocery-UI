import 'package:flutter_project/exports.dart';

class ProductCard extends StatelessWidget {
  final Product item;
  final VoidCallback? onCardTap;
  final VoidCallback? onPlusTap;

  const ProductCard({
    Key? key,
    required this.item,
    this.onCardTap,
    this.onPlusTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Container(
        width: 174,
        height: 250,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffE2E2E2)),
          borderRadius: defaultBorderRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Hero(
                  tag: "Grocery: ${item.name}",
                  child: Image.asset(item.imagePath),
                ),
              ),
            ),
            const SizedBox(height: 20),
            AppText(
              text: item.name,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            AppText(
              text: item.description ?? '',
              fontSize: 14,
              color: const Color(0xFF7C7C7C),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppText(text: "\$${item.price?.toStringAsFixed(2)}"),
                const Spacer(),
                GestureDetector(
                  onTap: onPlusTap,
                  child: Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: defaultBorderRadius,
                      color: AppColors.primaryColor,
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
