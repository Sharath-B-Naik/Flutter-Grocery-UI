import 'package:flutter_project/exports.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AppText(
        text: "No Favorite Items",
        fontWeight: FontWeight.w600,
        color: Color(0xFF7C7C7C),
      ),
    );
  }
}
