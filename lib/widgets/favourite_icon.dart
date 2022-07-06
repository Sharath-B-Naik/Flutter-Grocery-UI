import 'package:flutter_project/exports.dart';

class AnimatedFavoriteIcon extends StatefulWidget {
  const AnimatedFavoriteIcon({Key? key}) : super(key: key);

  @override
  _AnimatedFavoriteIconState createState() => _AnimatedFavoriteIconState();
}

class _AnimatedFavoriteIconState extends State<AnimatedFavoriteIcon> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        favorite = !favorite;
        setState(() {});
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            child: child,
            scale: animation,
          );
        },
        switchInCurve: Curves.easeInOutBack,
        switchOutCurve: Curves.easeInOutBack,
        child: Icon(
          favorite ? Icons.favorite : Icons.favorite_border,
          key: ValueKey(favorite ? "favorite" : "favorite_border"),
          color: favorite ? Colors.red : Colors.blueGrey,
          size: 30,
        ),
      ),
    );
  }
}
