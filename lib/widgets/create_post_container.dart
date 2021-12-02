// ignore_for_file: avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_responsive_ui/models/models.dart';
import 'package:facebook_responsive_ui/widgets/profile_avatar.dart';
import 'package:facebook_responsive_ui/widgets/responsive.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  const CreatePostContainer({Key? key, required this.currentUser})
      : super(key: key);
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
        elevation: isDesktop ? 1.0 : 0.0,
        shape: isDesktop
            ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
            : null,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Row(
                  children: [
                    ProfileAvatar(imageUrl: currentUser.imageUrl),
                    const SizedBox(
                      width: 8.0,
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'What\'s on your mind?',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 10.0,
                thickness: 0.5,
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton.icon(
                        onPressed: () => print('live'),
                        icon: const Icon(
                          Icons.videocam,
                          color: Colors.red,
                        ),
                        label: const Text(
                          'Live',
                          style: TextStyle(color: Colors.black),
                        )),
                    const VerticalDivider(
                      width: 8.0,
                    ),
                    TextButton.icon(
                        onPressed: () => print('photo'),
                        icon: const Icon(
                          Icons.photo_library,
                          color: Colors.green,
                        ),
                        label: const Text(
                          'Photo',
                          style: TextStyle(color: Colors.black),
                        )),
                    const VerticalDivider(
                      width: 8.0,
                    ),
                    TextButton.icon(
                        onPressed: () => print('room'),
                        icon: const Icon(
                          Icons.video_call,
                          color: Colors.purpleAccent,
                        ),
                        label: const Text(
                          'Room',
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
