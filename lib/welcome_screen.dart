import 'package:flutter_project/exports.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.welcomePNG),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Spacer(),
              SvgPicture.asset(
                Images.appIconSVG,
                width: 48,
                height: 56,
              ),
              const SizedBox(height: 20),
              const AppText(
                text: "Welcome",
                fontSize: 48,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              const AppText(
                text: "to our store",
                fontSize: 48,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              AppText(
                text: "Get your grecories as fast as in hour",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xffFCFCFC).withOpacity(0.7),
              ),
              const SizedBox(height: 40),
              AppButton(
                label: "Get Started",
                fontWeight: FontWeight.w600,
                onPressed: () {
                  RouteConfig.pushReplacement(context, const DashboardScreen());
                },
              ),
              const SizedBox(height: 40)
            ],
          ),
        ),
      ),
    );
  }
}
