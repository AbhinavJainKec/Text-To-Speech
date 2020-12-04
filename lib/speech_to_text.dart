import 'package:aur_sunao/constants.dart';
import 'package:aur_sunao/my_side_drawer.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';

class SpeechToText extends StatefulWidget {
  @override
  _SpeechToTextState createState() => _SpeechToTextState();
}

class _SpeechToTextState extends State<SpeechToText> {
  SpeechRecognition _speech;
  bool _isAvailable = false;
  bool _isListening = false;

  String resultText = " ";

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
  }

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
  }

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
  }
  
    String _currentLocale;
    _speech.setCurrentLocaleHandler((String locale) =>
        setState(() => _currentLocale = locale));

    _speech.setRecognitionStartedHandler(
          () => setState(() => _isListening = true),
    );

    _speech.setRecognitionResultHandler(
          (String text) => setState(() => resultText = text),
    );

    _speech.setRecognitionCompleteHandler(
          () => setState(() => _isListening = false),
    );

    _speech.activate().then(
          (res) => setState(() => _isAvailable = res),
    );

    _speech.listen(locale:_currentLocale).then((result)=> print('result : $result'));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MySideDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Speech to Text',
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
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                  child: Icon(
                    Icons.audiotrack,
                    color: Colors.teal,
                    size: 60,
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 300,
                ),
                SizedBox(
                  height: 200,
                  width: 100,
                  child: GestureDetector(
                    onTap: () {}, //TODO
                    child: FloatingActionButton(
                      heroTag: 'btn1',
                      splashColor: Colors.teal,
                      isExtended: true,
                      onPressed: () {}, //TODO
                      autofocus: false,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.speaker),
                          Text(
                            'Tap to Speak',
                            style: kButtonStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ), //TODO
      ),
    );
  }
}
