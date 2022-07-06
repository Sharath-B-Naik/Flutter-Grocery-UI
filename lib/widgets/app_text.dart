import 'package:flutter_project/exports.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color color;
  final TextAlign? textAlign;

  const AppText({
    required this.text,
    Key? key,
    this.fontSize,
    this.fontWeight,
    this.color = Colors.black,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 18,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color,
      ),
    );
  }
}
