import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/post_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/post_container.dart';
import 'package:flutter_facebook_responsive_ui/widgets/storys.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'Rooms.dart';
import 'circle_button.dart';
import 'createPostContainer.dart';

class HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController;

  const HomeScreenMobile({Key key, this.scrollController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          centerTitle: false,
          floating: true,
          title: Text(
            'facebook',
            style: const TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
          actions: [
            CircleButton(
                icon: Icons.search,
                iconSize: 30,
                onpessed: () {
                  print('search');
                }),
            CircleButton(
                icon: MdiIcons.facebookMessenger,
                iconSize: 30,
                onpessed: () {
                  print('messenger');
                }),
          ],
        ),
        SliverToBoxAdapter(
          child: CreatePostContainer(
            currentUser: currentUser,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          sliver: SliverToBoxAdapter(
            child: Stories(currentUser: currentUser, stories: stories),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          final Post post = posts[index];
          return PostContainer(post: post);
        }, childCount: posts.length))
      ],
    );
  }
}