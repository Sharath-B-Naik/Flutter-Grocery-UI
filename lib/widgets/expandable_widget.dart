import 'package:flutter/cupertino.dart';
import 'package:flutter_project/exports.dart';

class ExpandedWidget extends StatelessWidget {
  final String label;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool isExpanded;
  final String? description;
  const ExpandedWidget({
    Key? key,
    required this.label,
    this.trailing,
    this.onTap,
    required this.isExpanded,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                AppText(
                  text: label,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                const Spacer(),
                if (trailing != null) trailing!,
                const SizedBox(width: 20),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(
                      child: child,
                      scale: animation,
                    );
                  },
                  switchInCurve: Curves.easeInCirc,
                  switchOutCurve: Curves.easeInCirc,
                  child: Icon(
                    isExpanded
                        ? CupertinoIcons.chevron_down
                        : CupertinoIcons.chevron_right,
                    key: ValueKey(
                      isExpanded ? "chevron_down" : "chevron_right",
                    ),
                    color: Colors.blueGrey,
                    size: 20,
                  ),
                )
              ],
            ),
          ),
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: AppText(
              text: description!,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          )
      ],
    );
  }
}
