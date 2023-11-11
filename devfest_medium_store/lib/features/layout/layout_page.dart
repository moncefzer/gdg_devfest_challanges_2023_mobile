import 'package:devfest_store/core/config/app_colors.dart';
import 'package:devfest_store/features/card/card_page.dart';
import 'package:devfest_store/features/home/home_page.dart';
import 'package:devfest_store/features/profile/profile_page.dart';

import '../../core/constants/assets.dart';
import '../../core/utils/common_libs.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  //todo : refactor this to layout cubit
  int currentIndex = 0;
  final pages = [
    HomePage(),
    CardPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: AppColors.blue,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Image.asset(Assets.iconsHome06),
          ),
          BottomNavigationBarItem(
            label: 'Card',
            icon: Image.asset(Assets.iconsShoppingCartSimple),
          ),
          BottomNavigationBarItem(
            label: 'Card',
            icon: Image.asset(Assets.iconsUser),
          ),
        ],
      ),
    );
  }
}
