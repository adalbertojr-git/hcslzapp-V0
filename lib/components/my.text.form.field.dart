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
    double _borderRadius = 15.0;
    return Container(
      padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        obscureText: hidden ?? false,
        readOnly: disabled ?? false,
        textAlign: textAlign ?? TextAlign.left,
        maxLength: maxLength ?? null,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
          fillColor: Colors.black26,
          filled: disabled ?? false,
          prefixIcon: Icon(
            icon,
            color: Colors.deepOrange.withOpacity(.7),
          ),
          labelText: label,
          labelStyle: TextStyle(
            fontStyle: FontStyle.italic,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            fontStyle: FontStyle.italic,
          ),
          prefixText: prefix,
          errorText: errorText ?? null,
          errorStyle: TextStyle(
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
