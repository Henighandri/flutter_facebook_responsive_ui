import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/screen/home_screen.dart';
import 'package:flutter_facebook_responsive_ui/widgets/custom_app_bar.dart';
import 'package:flutter_facebook_responsive_ui/widgets/custom_tab_bar.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context)?
        PreferredSize(preferredSize: Size(MediaQuery.of(context).size.width, 100),
        child: CustomAppBar(
          currentUser:currentUser,
          icons:_icons,
          selectedIndex:_selectedIndex,
           onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }
        ),
        )
        :null,
        body:
            /*TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: _screens,
        ),*/
            IndexedStack(index: _selectedIndex, children: _screens),
        bottomNavigationBar: !Responsive.isDesktop(context)? Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: CustomTabBar(
                icons: _icons,
                selectedIndex: _selectedIndex,
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ):SizedBox.shrink()
      ),
    );
  }
}
