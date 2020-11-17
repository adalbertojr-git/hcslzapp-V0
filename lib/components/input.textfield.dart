import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController controller;
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

  InputTextField(
      {this.controller,
      this.helper,
      this.hint,
      this.icon,
      this.inputType,
      this.hidden,
      this.disabled,
      this.prefix,
      this.label,
      this.nLines,
      this.size});

  @override
  Widget build(BuildContext context) {
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
              color: Colors.lightBlueAccent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white70,
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
          labelStyle: TextStyle(fontSize: 13.0),
          hintText: hint,
          hintStyle: TextStyle(fontSize: 12.0, color: Colors.black54),
          prefixText: prefix,
          helperText: helper,
          helperStyle: TextStyle(fontSize: 10.0, color: Colors.black54),
        ),
        keyboardType: inputType,
        onSaved: (String value) {},
        validator: (String value) {
          return value;
        },
        maxLines: nLines != null ? nLines : 1,
        controller: controller,
      ),
    );
  }
}
