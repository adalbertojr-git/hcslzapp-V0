import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? helper;
  final String? hint;
  final IconData? icon;
  final TextInputType? inputType;
  final bool? hidden;
  final bool? disabled;
  final String? prefix;
  final int? nLines;
  final String? label;
  final double? fontSize;
  final Function(String)? onChanged;
  final String? errorText;
  MaskTextInputFormatter? maskTextInputFormatter;
  final int? maxLength;
  final TextAlign? textAlign;

  MyTextFormField({
    this.textEditingController,
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
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    maskTextInputFormatter = maskTextInputFormatter ?? MaskTextInputFormatter();
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
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
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
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
            //color: Colors.black87,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 13.0,
            fontStyle: FontStyle.italic,
            //color: Colors.black45,
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
        inputFormatters: [maskTextInputFormatter!],
      ),
    );
  }
}
