import 'package:aegis_vpn/general/general_screens.dart';
import 'package:aegis_vpn/servers_pages/servers_page.dart';
import 'package:aegis_vpn/settings_page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 1;

  final List<GlobalKey<NavigatorState>> navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  void _onTap(int index) {
    if (index == currentPageIndex) {
      navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        currentPageIndex = index;
      });
    }
  }

  Widget _buildOffstageNavigator(int index) {
    return Offstage(
      offstage: currentPageIndex != index,
      child: Navigator(
        key: navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          Widget page;
          switch (index) {
            case 0:
              page = ServersPage();
              break;
            case 1:
              page = GeneralScreens();
              break;
            case 2:
              page = SettingsPage();
              break;
            default:
              page = GeneralScreens();
          }
          return MaterialPageRoute(builder: (_) => page);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _buildOffstageNavigator(0),
          _buildOffstageNavigator(1),
          _buildOffstageNavigator(2),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: _onTap,
        backgroundColor: Colors.black,
        indicatorColor: Colors.transparent,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
          return TextStyle(
            color:
                states.contains(MaterialState.selected)
                    ? Colors.white
                    : Colors.grey,
            fontSize: 14,
          );
        }),
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/icons/4444444.svg',
              color: currentPageIndex == 0 ? Colors.white : Colors.grey,
            ),
            selectedIcon: SvgPicture.asset(
              'assets/icons/333333.svg',
              color: currentPageIndex == 0 ? Colors.white : Colors.grey,
            ),
            label: 'Сервера',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/icons/nav 2 2.svg',
              color: currentPageIndex == 1 ? Colors.white : Colors.grey,
            ),
            selectedIcon: SvgPicture.asset(
              'assets/icons/nav 2 1.svg',
              color: currentPageIndex == 1 ? Colors.white : Colors.grey,
            ),
            label: 'Главная',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/icons/nav 3 2.svg',
              color: currentPageIndex == 2 ? Colors.white : Colors.white,
            ),
            selectedIcon: SvgPicture.asset(
              'assets/icons/nav 3 1 .svg',
              color: currentPageIndex == 2 ? Colors.white : Colors.white,
            ),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }
}
