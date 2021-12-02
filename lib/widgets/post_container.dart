import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_responsive_ui/config/palette.dart';
import 'package:facebook_responsive_ui/models/post_model.dart';
import 'package:facebook_responsive_ui/widgets/profile_avatar.dart';
import 'package:facebook_responsive_ui/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(
          vertical: 5.0, horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(
                    post: post,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    post.caption,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            if (post.imageUrl != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: CachedNetworkImage(imageUrl: post.imageUrl.toString()),
              )
            else
              const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _PostInteraction(
                post: post,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key? key, required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Text(
                    post.timeAgo,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey.shade600,
                    size: 14.0,
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
            onPressed: () => print('More'),
            icon: const Icon(
              Icons.more_horiz,
              size: 18.0,
            )),
      ],
    );
  }
}

class _PostInteraction extends StatelessWidget {
  final Post post;

  const _PostInteraction({Key? key, required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                  color: Palette.facebookBlue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.thumb_up,
                  size: 10.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Expanded(
                child: Text(
                  post.likes.toString(),
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ),
              Text(
                post.comments.toString() + ' comments',
                style: TextStyle(color: Colors.grey.shade600),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                post.shares.toString() + ' shares',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              _PostButton(
                icon: Icon(
                  MdiIcons.thumbUpOutline,
                  color: Colors.grey.shade600,
                  size: 20.0,
                ),
                label: 'Like',
                onTap: () => print('Like'),
              ),
              _PostButton(
                icon: Icon(
                  MdiIcons.commentOutline,
                  color: Colors.grey.shade600,
                  size: 20.0,
                ),
                label: 'Comment',
                onTap: () => print('Comment'),
              ),
              _PostButton(
                icon: Icon(
                  MdiIcons.shareOutline,
                  color: Colors.grey.shade600,
                  size: 25.0,
                ),
                label: 'Share',
                onTap: () => print('Share'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final GestureTapCallback onTap;

  const _PostButton(
      {Key? key, required this.icon, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        // to get the effect
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  width: 4.0,
                ),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
