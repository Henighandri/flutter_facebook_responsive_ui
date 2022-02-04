import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomTabBar({Key key, this.icons, this.selectedIndex, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TabBar(
      
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Palette.facebookBlue, width: 3))),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(
                    e,
                    color: i == selectedIndex
                        ? Palette.facebookBlue
                        : Colors.black45,
                    size: 30,
                  ),
                ),
              ))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
