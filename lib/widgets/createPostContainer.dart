import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profil_avatar.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';

import '../config/palette.dart';
import '../models/user_model.dart';

class CreatePostContainer extends StatelessWidget {
  const CreatePostContainer({
    Key key,
    @required this.currentUser,
  }) : super(key: key);
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop=Responsive.isDesktop(context);
    return Card(
        margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 0),
        elevation: isDesktop ? 1 : 0,
        shape: isDesktop ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)):null,
          child: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
        child: Column(
          children: [
            Row(
              children: [
                ProfilAvatar(
                  imageUrl: currentUser.imageUrl,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'what\'s on your mind ?',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Palette.facebookBlue,
                              ),
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              height: 10,
              thickness: 0.5,
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    label: Text(
                      'Live',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const VerticalDivider(
                    width: 8,
                  ),
                  FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    label: Text(
                      'Photo',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const VerticalDivider(
                    width: 8,
                  ),
                  FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.video_call,
                      color: Colors.brown,
                    ),
                    label: Text(
                      'Room',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
