import 'package:flutter_project/exports.dart';

class HeadingTrailingButtton extends StatelessWidget {
  final String heading;
  final VoidCallback? onSeeAllTap;
  const HeadingTrailingButtton({
    Key? key,
    required this.heading,
    this.onSeeAllTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(text: heading, fontSize: 24),
        const Spacer(),
        const AppText(
          text: "See All",
          fontSize: 16,
          color: AppColors.primaryColor,
        ),
      ],
    );
  }
}
