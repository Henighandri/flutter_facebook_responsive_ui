import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/widgets/home_screen_desk.dart';
import 'package:flutter_facebook_responsive_ui/widgets/home_screen_mobil.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    // TODO: implement dispose
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: HomeScreenMobile(scrollController: _trackingScrollController),
          desktop:
              HomeScreenDesktop(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}


