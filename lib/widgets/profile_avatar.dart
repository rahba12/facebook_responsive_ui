import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_responsive_ui/config/palette.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar(
      {Key? key,
      required this.imageUrl,
      this.isActive = false,
      this.hasBorder = false})
      : super(key: key);

  final String imageUrl;
  final bool isActive;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
            radius: hasBorder ? 18.0 : 20.0,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
        ),
        if (isActive)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Palette.online,
                  border: Border.all(width: 2.0, color: Colors.white)),
            ),
          ),
      ],
    );
  }
}
