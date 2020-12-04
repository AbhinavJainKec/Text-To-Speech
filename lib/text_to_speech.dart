import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'authentication.dart';
import 'my_side_drawer.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech extends StatefulWidget {
  @override
  _TextToSpeechState createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  Authentication authentication = Authentication();
  FlutterTts flutterTts = FlutterTts();
  TextEditingController textEditingController = TextEditingController();

  String myMessage;
  String myLanguage = 'en-IN';
  String language = 'English(IN)';
  void setLanguage(String currentLanguage) {
    print(currentLanguage);
    print(myLanguage);
    myLanguage = (currentLanguage == "Hindi")
        ? "hi-IN"
        : (currentLanguage == "English(US)")
            ? "en-US:"
            : (currentLanguage == "English(UK)")
                ? "en-GB"
                : (currentLanguage == "English(IN)")
                    ? "en-IN"
                    : (currentLanguage == "Bengali")
                        ? "bn-IN"
                        : (currentLanguage == "Tamil") ? "ta" : "hi-IN";
    print(myLanguage);
  }

  Future _speak(String myMessage, String myLanguage) async {
    print(await flutterTts.getLanguages);
    await flutterTts.setLanguage(myLanguage);
    await flutterTts.speak(myMessage);
  }

  Future _stop() async {
    await flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MySideDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Text To Speech',
          style: kTitleStyle,
        ),
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
        child: Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.text_fields,
                color: Colors.teal,
                size: 50,
              ),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    autovalidate: true,
                    autocorrect: true,
                    autofocus: false,
                    controller: textEditingController,
                    onChanged: (message) {
                      myMessage = message;
                    },
                    cursorColor: Colors.teal,
                    decoration: InputDecoration(
                      enabled: true,
                      hintText: 'Enter the text here',
                      isDense: true,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          textEditingController.clear();
                        },
                        child: Icon(
                          Icons.clear,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: null,
                    style: kMyMessageStyle,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  height: 20,
                  width: double.maxFinite,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: Text('Select Language Accent'),
                      elevation: 5,
                      value: language,
                      iconSize: 30,
                      items: <String>[
                        'Hindi',
                        'English(US)',
                        'English(UK)',
                        'English(IN)',
                        'Bengali',
                        'Tamil',
                      ].map<DropdownMenuItem<String>>((String newlanguage) {
                        return DropdownMenuItem<String>(
                          value: newlanguage,
                          child: Text(newlanguage),
                        );
                      }).toList(),
                      onChanged: (String newLanguage) {
                        setState(() {
                          language = newLanguage;
                          setLanguage(language);
                          print(language);
                          print(myLanguage);
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: FloatingActionButton(
                    heroTag: "btn1",
                    autofocus: false,
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.teal[900],
                      size: 40,
                    ),
                    isExtended: true,
                    elevation: 5,
                    splashColor: Colors.blueGrey,
                    onPressed: () {
                      _speak(myMessage, myLanguage);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: FloatingActionButton(
                    heroTag: "btn2",
                    backgroundColor: Colors.blueGrey,
                    autofocus: false,
                    child: Icon(
                      Icons.stop,
                      color: Colors.blueGrey[900],
                      size: 40,
                    ),
                    isExtended: true,
                    elevation: 5,
                    splashColor: Colors.blueGrey,
                    onPressed: () {
                      _stop();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ), //TODO
    );
  }
}
