import 'package:aur_sunao/privacy_policy.dart';
import 'package:aur_sunao/settings.dart';
import 'package:aur_sunao/speech_to_text.dart';
import 'package:aur_sunao/text_to_speech.dart';
import 'package:flutter/material.dart';
import 'about_us.dart';
import 'camera.dart';
import 'constants.dart';

class MySideDrawer extends StatefulWidget {
  
  @override
  _MySideDrawerState createState() => _MySideDrawerState();
}

class _MySideDrawerState extends State<MySideDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Aur Sunao',
                  style: kDrawerHeaderStyle,
                  textAlign: TextAlign.start,
                ),
              ),
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.teal, Colors.blueGrey]),
              ),
            ),
            MyDrawerTile(
              myIcon: Icons.text_fields,
              mySubtitle: 'Converts Text into Speech.',
              myTitle: 'Text to speech',
              myFunction: () {
                setState(() {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TextToSpeech()));
                });
              },
            ),
            MyDrawerTile(
              myIcon: Icons.audiotrack,
              mySubtitle: 'Converts Speech into Text.',
              myTitle: 'Speech to Text',
              myFunction: () {
                setState(() {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SpeechToText(),
                          maintainState: true));
                });
              },
            ),
            MyDrawerTile(
              myIcon: Icons.camera,
              mySubtitle: 'Converts Image\'s text into Speech',
              myTitle: 'Camera to Text',
              myFunction: () {
                setState(() {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CameraToText()));
                });
              },
            ),
            MyDrawerTile(
              myIcon: Icons.settings,
              mySubtitle: 'Customization and Account Settings',
              myTitle: 'Settings',
              myFunction: () {
                setState(() {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                });
              },
            ),
            MyDrawerTile(
              myIcon: Icons.business,
              mySubtitle:
                  'Everything you need to know about our Privacy Policy',
              myTitle: 'Privacy',
              myFunction: () {
                setState(() {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PrivacyPolicy()));
                });
              },
            ),
            MyDrawerTile(
              myIcon: Icons.business,
              mySubtitle: 'Aur Sunao Team and its Members',
              myTitle: 'About Us',
              myFunction: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUs()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyDrawerTile extends StatelessWidget {
  final IconData myIcon;
  final String mySubtitle;
  final String myTitle;
  final Function myFunction;

  MyDrawerTile(
      {@required this.myIcon,
      this.mySubtitle,
      @required this.myTitle,
      @required this.myFunction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        myIcon,
        color: Colors.teal,
        size: 30,
      ),
      subtitle: Text(mySubtitle),
      contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      title: Text(
        myTitle,
        style: kDrawerContentTextStyle,
      ),
      onTap: myFunction,
    );
  }
}
