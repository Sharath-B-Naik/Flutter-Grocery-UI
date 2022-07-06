import 'package:flutter_project/exports.dart';

class AppButton extends StatelessWidget {
  final String label;
  final FontWeight? fontWeight;
  final VoidCallback onPressed;

  const AppButton({
    Key? key,
    required this.label,
    this.fontWeight,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(2.0),
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 40)),
        backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
        shape: MaterialStateProperty.all(const StadiumBorder()),
        side: MaterialStateProperty.all(
          const BorderSide(
            color: AppColors.primaryColor,
            width: 1,
          ),
        ),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.button!.copyWith(
              fontSize: 18,
              color: Colors.white,
              fontWeight: fontWeight,
            ),
      ),
    );
  }
}
