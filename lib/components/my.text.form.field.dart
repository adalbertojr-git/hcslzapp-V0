import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// ignore: must_be_immutable
class MyTextFormField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? helper;
  final String? hint;
  final IconData? icon;
  final TextInputType? inputType;
  final bool? isPassword;
  final bool? disabled;
  final String? prefix;
  final int? nLines;
  final String? label;
  final Function(String)? onChanged;
  final Function()? onTap;
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
    this.isPassword,
    this.disabled,
    this.prefix,
    this.label,
    this.nLines,
    this.onChanged,
    this.onTap,
    this.errorText,
    this.maskTextInputFormatter,
    this.maxLength,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    maskTextInputFormatter = maskTextInputFormatter ?? MaskTextInputFormatter();
    double _borderRadius = 10.0;
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        obscureText: isPassword ?? false,
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
          fillColor: Colors.black12,
          filled: disabled ?? false,
          prefixIcon: icon != null
              ? Icon(
                  icon,
                  color: Colors.deepOrange.withOpacity(.7),
                )
              : null,
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
          isDense: true,
        ),
        keyboardType: inputType,
        maxLines: nLines ?? 1,
        controller: textEditingController,
        onChanged: onChanged,
        onTap: onTap,
        inputFormatters: [maskTextInputFormatter!],
      ),
    );
  }
}
