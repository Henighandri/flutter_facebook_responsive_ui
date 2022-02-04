
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profil_avatar.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({Key key, @required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
  final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 0,
       vertical: 5
      ),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : null,
          child: Container(
        
        padding: const EdgeInsets.symmetric(vertical: 8),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post: post),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(post.caption),
                  post.imageUrl != null
                      ? const SizedBox.shrink()
                      : const SizedBox(
                          height: 6,
                        )
                ],
              ),
            ),
            post.imageUrl != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CachedNetworkImage(imageUrl: post.imageUrl),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: _PostStats(post: post),
            )
            
          ],
        ),
      ),
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Palette.facebookBlue,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.thumb_up,
                  size: 10,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Text(
                  "${post.likes}",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              Text(
                "${post.comments} Comments",
                style: TextStyle(color: Colors.grey[600]),
              ),
              Text(" . "),
              Text(
                "${post.shares} Shares",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
          const Divider(),
          Row(children: [
            _PostButton(
              icon:Icon(MdiIcons.thumbUpOutline,
              color:Colors.grey[600],
              size: 25,
              ),
              label:'Like',
              onTap:(){print("Like");}
            ),
            _PostButton(
              icon:Icon(MdiIcons.commentOutline,
              color:Colors.grey[600],
               size: 25,
              ),
              label:'Comment',
              onTap:(){print("Comment");}
            ),
            _PostButton(
              icon:Icon(MdiIcons.shareOutline,
              color:Colors.grey[600],
               size: 25,
              ),
              label:'Share',
              onTap:(){print("Share");}
            ),

          ],)
        ],
      ),
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const _PostButton({Key key, 
  @required this.icon,
  @required this.label,
  @required this.onTap
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Material(
        color: Colors.white,
            child: InkWell(
          onTap: onTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                SizedBox(width: 4,),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  const _PostHeader({
    Key key,
    this.post,
  }) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfilAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} .',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})
      ],
    );
  }
}
