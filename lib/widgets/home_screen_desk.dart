import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/models/post_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/post_container.dart';
import 'package:flutter_facebook_responsive_ui/widgets/storys.dart';
import 'package:flutter_facebook_responsive_ui/widgets/user_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'Rooms.dart';
import 'contact_list.dart';
import 'createPostContainer.dart';

class HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;

  const HomeScreenDesktop({Key key, this.scrollController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: MoreOptionList(currentUser: currentUser)),
          ),
        ),
        const Spacer(),
        Container(
            width: 600,
            color: Palette.scaffold,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  sliver: SliverToBoxAdapter(
                    child: Stories(currentUser: currentUser, stories: stories),
                  ),
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
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  final Post post = posts[index];
                  return PostContainer(post: post);
                }, childCount: posts.length))
              ],
            )),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: ContactsList(users: onlineUsers)),
          ),
        ),
      ],
    );
  }
}

class MoreOptionList extends StatelessWidget {
final List<List> _moreOptionsList = const [
    [MdiIcons.shieldAccount, Colors.deepPurple, 'COVID-19 Info Center'],
    [MdiIcons.accountMultiple, Colors.cyan, 'Friends'],
    [MdiIcons.facebookMessenger, Palette.facebookBlue, 'Messenger'],
    [MdiIcons.flag, Colors.orange, 'Pages'],
    [MdiIcons.storefront, Palette.facebookBlue, 'Marketplace'],
    [Icons.ondemand_video, Palette.facebookBlue, 'Watch'],
    [MdiIcons.calendarStar, Colors.red, 'Events'],
  ];

  final User currentUser;

  const MoreOptionList({Key key, @required this.currentUser}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280),
      child: ListView.builder(
        itemCount: 1+_moreOptionsList.length,
        itemBuilder: (context,index){
          if(index==0){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: UserCard(user:currentUser),
            );
          }
          final List option = _moreOptionsList[index-1];
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child:_Option(icon:option[0],color:option[1],label:option[2],)
            ); ;


        }),
    );
  }
}
class _Option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _Option({Key key, this.icon, this.color, this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(label),
      child: Row(
        children: [
          Icon(icon, size: 38.0, color: color),
          const SizedBox(width: 6.0),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16.0),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}