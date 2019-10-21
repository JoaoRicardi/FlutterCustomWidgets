import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomCamera {
  static Future<File> getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    return image;
  }

  static Future<File> openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    return image;
  }

  static Future<File> openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    return image;
  }

  static Future<void> optionsDialogBox(BuildContext context) {
    return showDialog(context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                GestureDetector(
                  child: new Text('Tirar foto'),
                  onTap: openCamera,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                GestureDetector(
                  child: new Text('Selecionar da galeria'),
                  onTap: openGallery,
                ),
              ],
            ),
          ),
        );
      });
  }
}