import 'package:flutter/material.dart';
import 'package:flutter_architecture_rx/src/values/colors.dart' as colors;
import 'package:flutter_architecture_rx/src/values/dimens.dart' as dimens;

class DropDownInput extends StatelessWidget {
  final bool autofocus;
  final String value;
  final Function(dynamic) onChange;
  final String placeholder;
  final TextInputType keyboardType;
  final bool password;
  final bool dark;
  final bool multiline;
  final String labelText;
  final List<DropdownMenuItem> listItens;


  const DropDownInput({Key key,this.listItens, this.autofocus, this.value, this.onChange, this.placeholder, this.keyboardType, this.password, this.dark, this.multiline, this.labelText});


  @override
  Widget build(BuildContext context) {
    return  DropdownButtonFormField(
              items:listItens ,
              decoration: InputDecoration(
                hintText: placeholder,
                labelText: labelText == null ? placeholder: labelText,              
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: colors.primaryColorDark, //cor da borda
                    width: 0.0
                  ),
                ),
                hintStyle: TextStyle(
                  color:Colors.transparent, //cor do placeholder com foco
                  fontSize: dimens.fontEditText
                ),
                enabled: true,
                labelStyle: TextStyle(
                  fontSize: dimens.fontEditText, 
                  color: dark == true ? colors.backgroundColor : colors.primaryColorDark //cor da label
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: colors.primaryColorDark, //cor da label quando esta com focus
                    width: 0
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: dark == true ? colors.backgroundColor : colors.primaryColorDark, //cor da label quando esta com focus
                    width: 1
                  )
                )
              )
    );
  }
}