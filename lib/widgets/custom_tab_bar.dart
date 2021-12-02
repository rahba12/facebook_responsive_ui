import 'package:facebook_responsive_ui/config/palette.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar(
      {Key? key,
      required this.icons,
      required this.selectedIndex,
      required this.onTap,
      this.isBottomIndicator = false})
      : super(key: key);

  final List<IconData> icons;
  final int selectedIndex;
  final ValueChanged onTap;
  final bool isBottomIndicator;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
          border: isBottomIndicator
              ? const Border(
                  bottom: BorderSide(color: Palette.facebookBlue, width: 3.0))
              : const Border(
                  top: BorderSide(color: Palette.facebookBlue, width: 3.0))),
      tabs: icons
          .asMap()
          .map((index, e) => MapEntry(
              index,
              Tab(
                icon: Icon(
                  e,
                  color: index == selectedIndex
                      ? Palette.facebookBlue
                      : Colors.grey,
                ),
              )))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
