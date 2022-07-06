import 'package:flutter_project/exports.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(16),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F3F2),
        borderRadius: defaultBorderRadius,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            Images.searchSVG,
            height: 18.21,
            width: 18.21,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              cursorWidth: 2,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                isDense: true,
                border: InputBorder.none,
                hintText: "Search Store",
                hintStyle: TextStyle(color: Color(0xFF7C7C7C), fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
