import 'package:aur_sunao/constants.dart';
import 'package:aur_sunao/my_side_drawer.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MySideDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('About Us', style: kTitleStyle),
      ),
      body: DoubleBackToCloseApp(
          snackBar: SnackBar(
            content: Text(
              'Tap again to exit',
              style: kMySnackBarTextStyle,
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          ),
          child: Container()), //TODO
    );
  }
}
