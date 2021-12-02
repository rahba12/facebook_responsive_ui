import 'package:facebook_responsive_ui/config/palette.dart';
import 'package:facebook_responsive_ui/models/models.dart';
import 'package:facebook_responsive_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final int selectedIndex;
  final List<IconData> icons;
  final ValueChanged onTap;
  final User currentUser;

  const CustomAppBar(
      {Key? key,
      required this.selectedIndex,
      required this.icons,
      required this.onTap,
      required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black12, offset: Offset(0.0, 2.0), blurRadius: 4.0)
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Text(
                'facebook',
                style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Palette.facebookBlue,
                    letterSpacing: -1.2),
              ),
            ),
            SizedBox(
              height: double.infinity,
              width: 600.0,
              child: CustomTabBar(
                selectedIndex: selectedIndex,
                icons: icons,
                onTap: onTap,
                isBottomIndicator: true,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  UserCard(user: currentUser),
                  const SizedBox(
                    width: 12.0,
                  ),
                  CircleButton(
                    icon: Icons.search,
                    iconColor: Colors.black,
                    iconSize: 24.0,
                    onPressed: () => print('Search'),
                  ),
                  CircleButton(
                    icon: MdiIcons.facebookMessenger,
                    iconColor: Colors.black,
                    iconSize: 24.0,
                    onPressed: () => print('Messenger'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
