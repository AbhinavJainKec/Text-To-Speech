import 'package:aur_sunao/sign_up.dart';
import 'package:aur_sunao/text_to_speech.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'rounded_button.dart';
import 'log_in.dart';
import 'sign_up.dart';
import 'privacy_policy.dart';
import 'about_us.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _auth = FirebaseAuth.instance;

  void guestLogin() async {
    try {
      final user = await _auth.signInAnonymously();
      print('You are logged in');
      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TextToSpeech()));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome',
          style: kTitleStyle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 150,
                width: 100,
                child: Image.asset(
                  'images/aur_sunao_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                'Aur',
                style: kAurTextStyle,
              ),
              Text(
                'Sunao',
                style: kSunaoTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              RoundedButton(
                myButtonColor: Colors.blueGrey,
                myButtonText: 'LOG IN',
                myButtonFunction: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LogIn()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              RoundedButton(
                myButtonColor: Colors.teal,
                myButtonText: 'SIGNUP',
                myButtonFunction: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              RoundedButton(
                myButtonColor: Colors.tealAccent,
                myButtonText: 'GUEST LOG IN',
                myButtonFunction: () {
                  setState(() {
                    guestLogin();
                  });
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PrivacyPolicy())); //TODO(Security Threat)
              },
              child: Text(
                'Privacy Policy',
                style: kNavTextStyle,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUs())); //TODO(Security Threat)
              },
              child: Text(
                'About Us',
                style: kNavTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
