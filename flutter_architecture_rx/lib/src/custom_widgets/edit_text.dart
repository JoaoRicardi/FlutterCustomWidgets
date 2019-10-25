import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_architecture_rx/src/values/colors.dart' as colors;
import 'package:flutter_architecture_rx/src/values/dimens.dart' as dimens;

class EditText extends StatefulWidget {
  final bool autofocus;
  final Stream<dynamic> value;
  final Function(dynamic) onChange;
  final String placeholder;
  final TextInputType keyboardType;
  final bool password;
  final bool dark;
  final bool multiline;
  final String labelText;
  final String mask;

  const EditText({Key key, this.autofocus, this.value, this.onChange, this.placeholder, this.keyboardType, this.password, this.dark, this.multiline, this.labelText, this.mask}) : super(key: key);

  @override
  _EditTextState createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  TextEditingController _controller;

  @override
  void didChangeDependencies() {
    _controller = new TextEditingController();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder<dynamic>(
      stream: widget.value,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          _controller.text = snapshot.data.toString();
          _controller.selection = TextSelection.collapsed(offset: snapshot.data.toString().length);
        }
        return TextField(
          controller: _controller,
          obscureText: widget.password == true ? true : false,
          onChanged: (text) {
            if (widget.onChange != null) widget.onChange(text);
          },
          maxLines: widget.multiline == true ? null : 1,
          keyboardType: widget.multiline == true ? TextInputType.multiline : widget.keyboardType,
          style: TextStyle(
            color: widget.dark == true ? colors.accentColor : colors.accentColor  //cor do texto ao digitar,
          ),
          autofocus: widget.autofocus == null ? false : true,
          textCapitalization: TextCapitalization.none,
          decoration: InputDecoration(
            hintText: snapshot.data == null ? "Holder" : snapshot.data.toString() ,
            labelText: widget.labelText == null ? widget.placeholder: widget.labelText,
            errorText: snapshot.error,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colors.accentColor, //cor da borda
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
              color: widget.dark == true ? colors.accentColor : colors.accentColor //cor da label
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: colors.primaryColorDark, //cor da label quando esta com focus
                width: 0
              )
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.dark == true ? colors.accentColor : colors.accentColor, //cor da label quando esta com focus
                width: 1
              )
            )
          )
        );
      }
    );
  }
}
