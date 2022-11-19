import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MyTextFormField extends StatelessWidget {
  TextEditingController? textEditingController;
  String? helper;
  String? hint;
  IconData? icon;
  TextInputType? inputType;
  bool? hidden;
  bool? disabled;
  String? prefix;
  int? nLines;
  String? label;
  double? fontSize;
  //String? text;
  Function(String)? onChanged;
  String? errorText;
  MaskTextInputFormatter? maskTextInputFormatter;
  int? maxLength;
  TextAlign? textAlign;

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
      this.fontSize,
      //this.text,
      this.onChanged,
      this.errorText,
      this.maskTextInputFormatter,
      this.maxLength,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    //textEditingController?.text = text ?? "";
/*    textEditingController?.selection = TextSelection.fromPosition(TextPosition(
      offset: textEditingController?.text.length ?? 0,
    ));*/
    maskTextInputFormatter = maskTextInputFormatter ?? MaskTextInputFormatter();
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 3.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        obscureText: hidden ?? false,
        readOnly: disabled ?? false,
        style: TextStyle(
          fontSize: fontSize ?? 13.0,
        ),
        textAlign: textAlign ?? TextAlign.left,
        maxLength: maxLength ?? null,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              //color: Colors.orangeAccent,
              color: Colors.white,
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
          filled: disabled ?? false,
          icon: icon != null
              ? Icon(
                  icon,
                  color: Colors.orange,
                )
              : null,
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 13.0,
            fontStyle: FontStyle.italic,
            color: Colors.black87,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 13.0,
            fontStyle: FontStyle.italic,
            color: Colors.black45,
          ),
          prefixText: prefix,
          errorText: errorText ?? null,
          errorStyle: TextStyle(
            fontSize: 11.0,
            color: Colors.red,
          ),
        ),
        keyboardType: inputType,
        maxLines: nLines ?? 1,
        controller: textEditingController,
        onChanged: onChanged,
/*        inputFormatters:
            maskTextInputFormatter == null ? null : [maskTextInputFormatter],*/
        inputFormatters: [maskTextInputFormatter!],
      ),
    );
  }
}
