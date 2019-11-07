import 'package:flutter/material.dart';
class EditText extends StatelessWidget {

  final TextEditingController controller;
  final String label;
  final String hint;

  EditText({Key key, this.controller,this.hint,this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: (text) {
          controller.text = text;
        },
        style: TextStyle(
          color: Colors.black,
        ),
        textCapitalization: TextCapitalization.none,
        decoration: InputDecoration(
            hintText: hint,
            labelText: label,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black,
                  width: 0.0
              ),
            ),
            hintStyle: TextStyle(
                color:Colors.transparent,
                fontSize: 14
            ),
            enabled: true,
            labelStyle: TextStyle(
                fontSize: 14,
                color: Colors.black
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black,
                    width: 0
                )
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black,
                    width: 1
                )
            )
        )
    );
  }
}

