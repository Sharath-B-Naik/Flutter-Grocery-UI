import 'package:flutter_project/exports.dart';

class OrderFailedDialogue extends StatelessWidget {
  const OrderFailedDialogue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      insetPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close),
              ),
            ),
            const SizedBox(height: 20),
            const Image(
              image: AssetImage(Images.orderFailedPNG),
              height: 120,
              width: 120,
            ),
            const SizedBox(height: 20),
            const AppText(
              text: "Oops! Order Failed",
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 10),
            const AppText(
              text: "Something went temply wrong",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xff7C7C7C),
            ),
            const SizedBox(height: 20),
            AppButton(
              label: "Please Try Again",
              fontWeight: FontWeight.w600,
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const OrderAcceptedScreen();
                  },
                ));
              },
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: const AppText(
                text: "Back To Home",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
