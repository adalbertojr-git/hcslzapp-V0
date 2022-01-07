import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MyTextFormField extends StatelessWidget {
  TextEditingController textEditingController;
  String helper;
  String hint;
  IconData icon;
  TextInputType inputType;
  bool hidden;
  bool disabled;
  String prefix;
  int nLines;
  String label;
  double fontSize;
  String text;
  FunctionStringCallback onChanged;
  String errorText;
  MaskTextInputFormatter maskTextInputFormatter;
  int maxLength;
  TextAlign textAlign;

  MyTextFormField(
      {required this.textEditingController,
      required this.helper,
      required this.hint,
      required this.icon,
      required this.inputType,
      required this.hidden,
      required this.disabled,
      required this.prefix,
      required this.label,
      required this.nLines,
      required this.fontSize,
      required this.text,
      required this.onChanged,
      required this.errorText,
      required this.maskTextInputFormatter,
      required this.maxLength,
      required this.textAlign});

  @override
  Widget build(BuildContext context) {
    textEditingController.text = text;
    textEditingController.selection = TextSelection.fromPosition(TextPosition(
      offset: textEditingController.text.length,
    ));
    return Padding(
      padding: const EdgeInsets.fromLTRB(2.0, 3.0, 2.0, 3.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        obscureText: hidden != null ? hidden : false,
        readOnly: disabled != null ? disabled : false,
        style: TextStyle(
          fontSize: fontSize != null ? fontSize : 15.0,
        ),
        textAlign: textAlign != null ? textAlign : TextAlign.left,
        maxLength: maxLength != null ? maxLength : null,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orangeAccent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          fillColor: Colors.black26,
          filled: disabled != null ? true : false,
          icon: icon != null
              ? Icon(
                  icon,
                  color: Colors.orange,
                )
              : null,
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 14.0,
            fontStyle: FontStyle.italic,
            color: Colors.black87,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 12.0,
            fontStyle: FontStyle.italic,
            color: Colors.black45,
          ),
          prefixText: prefix,
          errorText: errorText == null ? null : errorText,
          errorStyle: TextStyle(
            fontSize: 11.0,
            color: Colors.red,
          ),
        ),
        keyboardType: inputType,
        maxLines: nLines != null ? nLines : 1,
        controller: textEditingController,
        onChanged: onChanged,
        inputFormatters:
            maskTextInputFormatter == null ? null : [maskTextInputFormatter],
      ),
    );
  }
}
