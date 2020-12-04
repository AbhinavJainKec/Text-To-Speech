import 'dart:io';
import 'package:aur_sunao/constants.dart';
import 'package:aur_sunao/my_side_drawer.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class CameraToText extends StatefulWidget {
  @override
  _CameraToTextState createState() => _CameraToTextState();
}

class _CameraToTextState extends State<CameraToText> {
  TextEditingController textEditingController = TextEditingController();

  String myValue = "";
  String myNewValue;

  Future readText() async {
    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(_pickedImage);
    TextRecognizer recognizer = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizer.processImage(ourImage);

    setState(() {
      for (TextBlock block in readText.blocks) {
        for (TextLine line in block.lines) {
          for (TextElement word in line.elements) {
            myValue = myValue + " " + (word.text.toString());
          }
        }
      }
    });
  }

  File _pickedImage;
  String myMessage;

  @override
  Widget build(BuildContext context) {
    // Future pickCameraImage() async {
    //   var image = await ImagePicker.pickImage(source: ImageSource.camera);

    //   setState(() {
    //     _pickedImage = image;
    //   });
    // }

    Future pickGalleryImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _pickedImage = image;
      });
    }

    return Scaffold(
      drawer: MySideDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Camera To Text',
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
          padding: EdgeInsets.all(10),
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
                child: Icon(
                  Icons.camera,
                  size: 70,
                  color: Colors.teal,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: 200,
                  width: 200,
                  child: Center(
                    child: _pickedImage == null
                        ? Text(
                          'Image not selected',
                          style: kMyMessageStyle,
                        )
                        : Image.file(_pickedImage),
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
                    backgroundColor: Colors.blueGrey,
                    autofocus: false,
                    child: Text('Gallary',
                        style: kButtonStyle.copyWith(
                          fontSize: 25,
                        )),
                    isExtended: true,
                    elevation: 5,
                    splashColor: Colors.blueGrey,
                    onPressed: pickGalleryImage,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(),
                child: SizedBox(
                  height: 50,
                  width: 400,
                  child: RaisedButton(
                    autofocus: false,
                    color: Colors.teal,
                    child: Text(
                      'Detect the Text',
                      style: kButtonStyle.copyWith(fontSize: 25),
                    ),
                    onPressed: () async {
                      readText();
                      myValue = " ";
                    },
                  ),
                ),
              ),

              // Padding(
              //   padding: EdgeInsets.all(10.0),
              //   child: SizedBox(
              //     height: 50,
              //     width: double.infinity,
              //     child: FloatingActionButton(
              //       heroTag: "btn2",
              //       backgroundColor: Colors.teal,
              //       autofocus: false,
              //       child: Text('Camera',
              //           style: kButtonStyle.copyWith(
              //             fontSize: 25,
              //           )),
              //       isExtended: true,
              //       elevation: 5,
              //       splashColor: Colors.teal,
              //       onPressed: pickCameraImage,
              //     ),
              //   ),
              // ),

              SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(myValue),
                  // child: TextFormField(
                  //   autovalidate: true,
                  //   autocorrect: true,
                  //   autofocus: false,
                  //   controller: textEditingController,
                  //   cursorColor: Colors.teal,
                  //   decoration: InputDecoration(
                  //     enabled: true,
                  //     hintText: 'The detected text will be displayed here.',
                  //     isDense: true,
                  //     suffixIcon: GestureDetector(
                  //       onTap: () {
                  //         textEditingController.clear();
                  //       },
                  //       child: Icon(
                  //         Icons.clear,
                  //         color: Colors.white,
                  //         size: 25,
                  //       ),
                  //     ),
                  //   ),
                  //   enabled: false,
                  //   keyboardType: TextInputType.multiline,
                  //   minLines: 1,
                  //   maxLines: null,
                  //   style: kMyMessageStyle,
                  // ),
                ),
              ),
            ],
          ),
        ),
      ), //TODO
    );
  }
}
