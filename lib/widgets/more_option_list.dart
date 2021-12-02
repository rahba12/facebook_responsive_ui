import 'package:facebook_responsive_ui/config/palette.dart';
import 'package:facebook_responsive_ui/models/models.dart';
import 'package:facebook_responsive_ui/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoreOptionList extends StatelessWidget {
  const MoreOptionList({Key? key, required this.currentUser}) : super(key: key);
  final User currentUser;

  final List<List> _moreOptionsList = const [
    [MdiIcons.shieldAccount, Colors.deepPurple, 'COVID-19 Info Center'],
    [MdiIcons.accountMultiple, Colors.cyan, 'Friends'],
    [MdiIcons.facebookMessenger, Palette.facebookBlue, 'Messenger'],
    [MdiIcons.flag, Colors.orange, 'Pages'],
    [MdiIcons.storefront, Palette.facebookBlue, 'Marketplace'],
    [Icons.ondemand_video, Palette.facebookBlue, 'Watch'],
    [MdiIcons.calendarStar, Colors.red, 'Events'],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxWidth: 200.0),
        child: ListView.builder(
          itemCount: 1 + _moreOptionsList.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: UserCard(
                  user: currentUser,
                ),
              );
            }
            final List options = _moreOptionsList[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: _Options(
                  icon: options[0], color: options[1], label: options[2]),
            );
          },
        ));
  }
}

class _Options extends StatelessWidget {
  const _Options(
      {Key? key, required this.icon, required this.color, required this.label})
      : super(key: key);

  final IconData icon;
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(label),
      child: Row(
        children: [
          Icon(
            icon,
            size: 30.0,
            color: color,
          ),
          const SizedBox(
            width: 6.0,
          ),
          Flexible(
              child: Text(
            label,
            style: const TextStyle(
                overflow: TextOverflow.ellipsis, fontSize: 16.0),
          )),
        ],
      ),
    );
  }
}
