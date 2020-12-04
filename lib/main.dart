import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'welcome_screen.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aur Sunao',
      theme: ThemeData.dark(),
      home: WelcomeScreen(),
    );
  }
}
