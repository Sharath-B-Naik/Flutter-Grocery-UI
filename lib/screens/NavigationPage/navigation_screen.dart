import 'package:flutter_project/exports.dart';

class _NavigationItem {
  final int index;
  final String label;
  final String iconPath;
  final Widget screen;

  _NavigationItem({
    required this.label,
    required this.iconPath,
    required this.index,
    required this.screen,
  });
}

List<_NavigationItem> _navigationItems = [
  _NavigationItem(
    index: 0,
    label: "Shop",
    iconPath: Images.shopSVG,
    screen: const HomeScreen(),
  ),
  _NavigationItem(
    index: 1,
    label: "Explore",
    iconPath: Images.exploreSVG,
    screen: const ExploreScreen(),
  ),
  _NavigationItem(
    index: 2,
    label: "Cart",
    iconPath: Images.cartSVG,
    screen: const CartScreen(),
  ),
  _NavigationItem(
    index: 3,
    label: "Favourite",
    iconPath: Images.favouriteSVG,
    screen: const FavouriteScreen(),
  ),
  _NavigationItem(
    index: 4,
    label: "Account",
    iconPath: Images.accountSVG,
    screen:  const AccountScreen(),
  ),
];

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        switchInCurve: Curves.easeInOutBack,
        child: Builder(
          key: ValueKey(_navigationItems[currentIndex].index),
          builder: (_) => _navigationItems[currentIndex].screen,
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF555E58).withOpacity(0.09),
              blurRadius: 15,
              offset: const Offset(2, -5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primaryColor,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
            unselectedItemColor: Colors.black,
            items: [
              ..._navigationItems.map(
                (item) {
                  return BottomNavigationBarItem(
                    label: item.label,
                    icon: SvgPicture.asset(
                      item.iconPath,
                      color: item.index == currentIndex
                          ? AppColors.primaryColor
                          : Colors.black,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
