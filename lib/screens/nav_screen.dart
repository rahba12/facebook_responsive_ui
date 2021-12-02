import 'package:facebook_responsive_ui/data/data.dart';
import 'package:facebook_responsive_ui/screens/screens.dart';
import 'package:facebook_responsive_ui/widgets/responsive.dart';
import 'package:facebook_responsive_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];

  int _currentIndex = 0;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
                preferredSize: Size(screenSize.width, 100),
                child: CustomAppBar(
                  selectedIndex: _selectedIndex,
                  currentUser: currentUser,
                  icons: _icons,
                  onTap: (index) => setState(() => _selectedIndex = index),
                ),
              )
            : null,
        body: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ), // save the last position Automatically

        // TabBarView(
        //   // physics: const NeverScrollableScrollPhysics(),
        //   children: _screens,
        // ),
        bottomNavigationBar: Responsive.isDesktop(context)
            ? const SizedBox.shrink()
            : CustomTabBar(
                icons: _icons,
                selectedIndex: _currentIndex,
                onTap: (index) => setState(() => _currentIndex = index),
              ),
        // BottomNavigationBar(
        //   type: BottomNavigationBarType.fixed,
        //   backgroundColor: Colors.white,
        //   items: _icons
        //       .map((title, icon) => MapEntry(
        //           title,
        //           BottomNavigationBarItem(
        //             icon: Icon(icon, size: 30.0),
        //             label: title,
        //           )))
        //       .values
        //       .toList(),
        //   currentIndex: _currentIndex,
        //   selectedItemColor: Colors.white,
        //   selectedFontSize: 11.0,
        //   unselectedItemColor: Colors.grey,
        //   unselectedFontSize: 11.0,
        //   onTap: (index) => setState(() => _currentIndex = index),
        // )
      ),
    );
  }
}
