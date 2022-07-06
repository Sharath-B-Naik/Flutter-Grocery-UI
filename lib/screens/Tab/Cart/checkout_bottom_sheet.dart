import 'package:flutter_project/exports.dart';

class CheckoutBottomSheet extends StatelessWidget {
  const CheckoutBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Wrap(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                const AppText(
                  text: "Checkout",
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Divider(height: 0),
          const ExpandedWidget(
            isExpanded: false,
            label: "Delivery",
            trailing: AppText(
              text: "Select Method",
              fontSize: 14,
            ),
          ),
          const Divider(height: 0),
          const ExpandedWidget(
            isExpanded: false,
            label: "Payment",
            trailing: Icon(Icons.payment),
          ),
          const Divider(height: 0),
          const ExpandedWidget(
            isExpanded: false,
            label: "Promo Code",
            trailing: AppText(text: "Pick Discount", fontSize: 14),
          ),
          const Divider(height: 0),
          const ExpandedWidget(
            isExpanded: false,
            label: "Total Cost",
            trailing: AppText(text: "\$13.97", fontSize: 14),
          ),
          const Divider(height: 0),
          const _TermsAndCondition(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: AppButton(
              label: "Place Order",
              fontWeight: FontWeight.w600,
              onPressed: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const OrderFailedDialogue();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TermsAndCondition extends StatelessWidget {
  const _TermsAndCondition({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: RichText(
        text: TextSpan(
          text: 'By placing an order you agree to our',
          style: TextStyle(
            color: const Color(0xFF7C7C7C),
            fontSize: 12,
            fontFamily: Theme.of(context).textTheme.bodyText1!.fontFamily,
            fontWeight: FontWeight.w600,
          ),
          children: const [
            TextSpan(
              text: " Terms",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(text: " And"),
            TextSpan(
              text: " Conditions",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
