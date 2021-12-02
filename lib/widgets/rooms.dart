// ignore_for_file: avoid_print, prefer_const_literals_to_create_immutables

import 'package:facebook_responsive_ui/config/palette.dart';
import 'package:facebook_responsive_ui/models/models.dart';
import 'package:facebook_responsive_ui/widgets/profile_avatar.dart';
import 'package:facebook_responsive_ui/widgets/responsive.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  const Rooms({Key? key, required this.onlineUsers}) : super(key: key);

  final List<User> onlineUsers;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        height: 60.0,
        color: Colors.white,
        child: ListView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 1 + onlineUsers.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: _CreateRoomButton(),
                );
              }
              final User user = onlineUsers[index - 1];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProfileAvatar(
                  imageUrl: user.imageUrl,
                  isActive: true,
                ),
              );
            }),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print('Create Room'),
      style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith(
              (states) => RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => Colors.white,
          ),
          side: MaterialStateProperty.resolveWith(
            (states) => BorderSide(
              width: 3.0,
              color: Colors.blueAccent.shade100,
            ),
          ),
          textStyle: MaterialStateProperty.resolveWith(
            (states) => const TextStyle(
              color: Palette.facebookBlue,
            ),
          )),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: const Icon(
              Icons.video_call,
              size: 30.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          const Text(
            'Create\nRoom',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
