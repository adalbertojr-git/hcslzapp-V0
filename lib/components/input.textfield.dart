import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String helper;
  final String hint;
  final IconData icon;
  final TextInputType inputType;
  final bool hidden;
  final bool disabled;
  final String prefix;
  final int nLines;
  final String label;
  final double size;
  final String text;
  final onChanged;
  final String errorText;

  InputTextField(
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
      this.errorText});

  @override
  Widget build(BuildContext context) {
    this.textEditingController.text = this.text;
    return Padding(
      padding: const EdgeInsets.fromLTRB(2.0, 3.0, 2.0, 3.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        obscureText: hidden != null ? hidden : false,
        readOnly: disabled != null ? disabled : false,
        style: TextStyle(
          fontSize: size != null ? size : 15.0,
        ),
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
          icon: icon != null
              ? Icon(
                  icon,
                  color: Colors.orange,
                )
              : null,
          //filled: true,
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 12.0,
            fontStyle: FontStyle.italic,
            color: Colors.black45,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 12.0,
            fontStyle: FontStyle.italic,
            color: Colors.black45,
          ),
          prefixText: prefix,
          errorText: this.errorText == null ? null : this.errorText,
          errorStyle: TextStyle(
            fontSize: 10.0,
            color: Colors.red,
          ),
        ),
        keyboardType: inputType,
        maxLines: nLines != null ? nLines : 1,
        controller: textEditingController,
        onChanged: this.onChanged,
      ),
    );
  }
}
