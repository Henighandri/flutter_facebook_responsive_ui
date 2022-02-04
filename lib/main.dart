import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/screen/home_screen.dart';
import 'package:flutter_facebook_responsive_ui/screen/nav_screen.dart';

import 'config/palette.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        scaffoldBackgroundColor:Palette.scaffold ,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NavScreen(),
    );
  }
}