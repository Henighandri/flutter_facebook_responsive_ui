import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profil_avatar.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';

import '../config/palette.dart';
import '../models/models.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({Key key, @required this.onlineUsers}) : super(key: key);
  @override
  Widget build(BuildContext context) {
 final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 0),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : null,
          child: Container(
          color: Colors.white,
          height: 60,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: onlineUsers.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: _CreateRoomButton());
                }
                final User user = onlineUsers[index - 1];
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: ProfilAvatar(imageUrl: user.imageUrl, isActive: true),
                );
              })),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: OutlineButton(
          onPressed: () => print('Create Room'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          color: Colors.white,
          borderSide: BorderSide(width: 3, color: Colors.blueAccent[100]),
          textColor: Palette.facebookBlue,
          /*child: ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),*/
          child: Row(
            children: [
              Icon(
                Icons.video_call,
                size: 35,
                color: Colors.purple,
              ),
              Text(
                "Create \nRoom",
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
        // ),
     
    );
  }
}
