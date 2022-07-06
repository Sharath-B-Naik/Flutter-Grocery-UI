import 'package:flutter_project/exports.dart';

class ItemCounterWidget extends StatefulWidget {
  final double price;
  final ValueChanged<int> onChanged;
  final bool isSmallCounter;

  const ItemCounterWidget({
    Key? key,
    required this.onChanged,
    required this.price,
    this.isSmallCounter = false,
  }) : super(key: key);

  @override
  _ItemCounterWidgetState createState() => _ItemCounterWidgetState();
}

class _ItemCounterWidgetState extends State<ItemCounterWidget> {
  int quantity = 1;

  double getTotalPrice() => quantity * widget.price;

  void incrementAmount() {
    quantity = quantity + 1;
    widget.onChanged.call(quantity);
    setState(() {});
  }

  void decrementAmount() {
    if (quantity <= 0) return;
    quantity = quantity - 1;
    widget.onChanged.call(quantity);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _icon(
          iconData: Icons.remove,
          iconColor: AppColors.darkGrey,
          onPressed: decrementAmount,
        ),
        const SizedBox(width: 30),
        AppText(
          text: "$quantity",
          color: Colors.black,
        ),
        const SizedBox(width: 30),
        _icon(
          iconData: Icons.add,
          iconColor: AppColors.primaryColor,
          onPressed: incrementAmount,
        ),
        const Spacer(),
        Text(
          "\$${getTotalPrice().toStringAsFixed(2)}",
          style: TextStyle(
            fontSize: widget.isSmallCounter ? 18 : 24,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Widget _icon({required IconData iconData, Color? iconColor, onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: widget.isSmallCounter ? 30 : 45,
        width: widget.isSmallCounter ? 30 : 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.isSmallCounter ? 10 : 17),
          border: Border.all(
            color: const Color(0xffE2E2E2),
          ),
        ),
        child: Center(
          child: Icon(
            iconData,
            color: iconColor ?? Colors.black,
            size: widget.isSmallCounter ? 18 : 24,
          ),
        ),
      ),
    );
  }
}
