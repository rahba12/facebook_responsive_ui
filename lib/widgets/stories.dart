import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_responsive_ui/config/palette.dart';
import 'package:facebook_responsive_ui/models/models.dart';
import 'package:facebook_responsive_ui/widgets/responsive.dart';
import 'package:facebook_responsive_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  const Stories({Key? key, required this.currentUser, required this.stories})
      : super(key: key);

  final User currentUser;
  final List<Story> stories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Responsive.isDesktop(context) ? Colors.transparent : Colors.white,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: _StoryCard(
                  isAddStory: true,
                  currentUser: currentUser,
                ),
              );
            }
            final Story story = stories[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(story: story),
            );
          }),
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard(
      {Key? key, this.isAddStory = false, this.currentUser, this.story})
      : super(key: key);

  final bool isAddStory;
  final User? currentUser;
  final Story? story;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
              height: double.infinity,
              width: 120.0,
              fit: BoxFit.cover,
              imageUrl: isAddStory ? currentUser!.imageUrl : story!.imageUrl),
        ),
        Container(
          height: double.infinity,
          width: 120.0,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: Responsive.isDesktop(context)
                ? const [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0)
                  ]
                : null,
          ),
        ),
        Positioned(
            top: 8.0,
            left: 8.0,
            child: isAddStory
                ? Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      iconSize: 25.0,
                      onPressed: () => print('Add to stories'),
                      icon: const Icon(
                        Icons.add,
                        color: Palette.facebookBlue,
                      ),
                    ),
                  )
                : ProfileAvatar(
                    imageUrl: story!.user.imageUrl,
                    hasBorder: story!.isViewed,
                  )),
        Positioned(
            bottom: 8.0,
            left: 8.0,
            child: Text(
              isAddStory ? 'Add to story' : story!.user.name,
              maxLines: 2,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis),
            )),
      ],
    );
  }
}
