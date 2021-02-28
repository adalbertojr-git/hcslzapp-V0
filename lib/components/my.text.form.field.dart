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
  double size;
  String text;
  Function onChanged;
  String errorText;
  MaskTextInputFormatter maskTextInputFormatter;
  int maxLengh;
  TextAlign textAlign;

  MyTextFormField(
      {this.textEditingController,
      this.helper,
      this.hint,
      this.icon,
      this.inputType,
      this.hidden,
      this.disabled,
      this.prefix,
      this.label,
      this.nLines,
      this.size,
      this.text,
      this.onChanged,
      this.errorText,
      this.maskTextInputFormatter,
      this.maxLengh,
      this.textAlign});

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
          fontSize: size != null ? size : 15.0,
        ),
        textAlign: textAlign != null ? textAlign : TextAlign.left,
        maxLength: maxLengh != null ? maxLengh : null,
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
          fillColor: Colors.white30,
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
