import 'package:flutter_project/exports.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Color(0xFFEDEDED),
                    child: Icon(
                      Icons.person,
                      color: Colors.black54,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      AppText(
                        text: "Sharath B Naik",
                        fontWeight: FontWeight.bold,
                      ),
                      AppText(
                        text: "github.com/sharath-b-naik",
                        color: Color(0xff7C7C7C),
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const Divider(height: 0),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SafeArea(
                top: false,
                child: Column(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: accountItems.length,
                      separatorBuilder: (_, __) => const Divider(height: 0),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(accountItems[index].iconPath),
                                const SizedBox(width: 20),
                                AppText(text: accountItems[index].label),
                                const Spacer(),
                                const Icon(Icons.chevron_right)
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const Divider(height: 0),
                    Container(
                      height: 50,
                      margin: const EdgeInsets.all(20.0),
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F3F2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        children: const [
                          Center(
                            child: AppText(
                              text: "Logout",
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.logout,
                              color: AppColors.primaryColor,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget logoutButton() {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: SvgPicture.asset(
                Images.logoutSVG,
              ),
            ),
            const Text(
              "Log Out",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
            Container()
          ],
        ),
        onPressed: () {},
      ),
    );
  }

  Widget getAccountItemWidget(AccountItem accountItem) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: SvgPicture.asset(
              accountItem.iconPath,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            accountItem.label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
