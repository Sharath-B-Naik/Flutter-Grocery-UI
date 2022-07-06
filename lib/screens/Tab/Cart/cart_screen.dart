import 'package:flutter_project/exports.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const AppText(
          text: "My Cart",
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (_, __) => const Divider(),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      children: [
                        Image.asset(
                         Images.pulsesPNG,
                          height: 80,
                          width: 80,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      AppText(text: "Pepper red"),
                                      AppText(
                                        text: "1kg, Price",
                                        fontSize: 12,
                                        color: AppColors.darkGrey,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.close)
                                ],
                              ),
                              const SizedBox(height: 10),
                              ItemCounterWidget(
                                price: 12.0,
                                isSmallCounter: true,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                child: AppButton(
                  label: "Go To Check Out",
                  fontWeight: FontWeight.w600,
                  onPressed: () {
                    showBottomSheet(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getButtonPriceWidget() {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: const Color(0xff489E67),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Text(
        "\$12.96",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  void showBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return const CheckoutBottomSheet();
      },
    );
  }
}
