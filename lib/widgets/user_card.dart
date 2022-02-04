import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profil_avatar.dart';

class UserCard extends StatelessWidget {
  final User user;
  final bool isActive;

  const UserCard({Key key, this.user, 
  this.isActive=false }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
          child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfilAvatar(imageUrl: user.imageUrl,isActive: isActive,),
          const SizedBox(
            width: 4,
          ),
          Text(
            user.name,
            style: TextStyle(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
