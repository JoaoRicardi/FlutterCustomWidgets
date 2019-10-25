
import 'package:flutter_architecture_rx/src/custom_widgets/modal.dart';
import 'package:flutter_architecture_rx/src/custom_widgets/radio_button.dart';
import 'package:flutter_architecture_rx/src/custom_widgets/text.dart';
import 'package:flutter_architecture_rx/src/values/colors.dart' as colors;
import 'package:flutter_architecture_rx/src/values/dimens.dart' as dimens;
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'divider_field.dart';

class CustomDropdown extends StatelessWidget {
  final BuildContext context;
  final String value;
  final Function onChoose;
  final String label;
  final List<String> items;  
  final Observable<String> comparativo;

  const CustomDropdown({Key key, @required this.context,this.comparativo, this.value, this.onChoose, this.label, this.items}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();
    
    List<Widget> options = [];

    if (value != null) _controller.text = value;

    if (items != null) 
      items.map((i) {
        options.add(
          StreamBuilder<String>(
            stream:comparativo,
            builder: (context, snapshot) {
              return RadioButton(
                onPress: () {
                 _controller.text = i; 
                 if (onChoose != null) onChoose(i);
                },
                status: snapshot.data == i ? true : false,
                label: i,
              );
            }
          )
        );
      }).toList();

    return TextField(
      controller: _controller,
      onChanged: (value) => null,
      enableInteractiveSelection: false,
      cursorColor: Colors.white,
      onTap: () {
        Modal.show(
          context,
          confirmLabel: "CONFIRMAR",
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomText(text: label, big: true),
              DividerField(height: 40),
              ...options
            ]
          )
        );
      },
      ////////////////////////////////////////////////////////////////////////////////////////////////////
      textCapitalization: TextCapitalization.none,
      style: TextStyle(color: colors.accentColor), //cor do texto ao digitar,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.arrow_drop_down),
        //errorText: snapshot.error,
        //hintText: placeholder,
        labelText: label ?? "",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.accentColor, //cor da borda
            width: 0.0
          ),
        ),
        hintStyle: TextStyle(
          color:colors.accentColor, //cor do placeholder com foco
          fontSize: dimens.fontEditText
        ),
        enabled: true,
        labelStyle: TextStyle(
          fontSize: dimens.fontEditText, 
          color: colors.primaryColorDark //cor da label
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.accentColor, //cor da label quando esta com focus
            width: 0
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.accentColor, //cor da label quando esta com focus
            width: 1
          )
        )
      )
    );
  }
}