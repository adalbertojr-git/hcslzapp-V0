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
  final String controllerText;

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
      this.size,
      this.controllerText});

  @override
  Widget build(BuildContext context) {
    _setController(controller, controllerText);
    return Padding(
      padding: const EdgeInsets.fromLTRB(2.0, 3.0, 2.0, 3.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        obscureText: hidden != null ? hidden : false,
        readOnly: disabled != null ? disabled : false,
        style: TextStyle(
          fontSize: size != null ? size : 17.0,
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.lightBlue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          icon: icon != null
              ? Icon(
                  icon,
                  color: Colors.orange,
                )
              : null,
          filled: true,
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
          helperText: helper,
          helperStyle: TextStyle(
            fontSize: 11.0,
            color: Colors.black26,
          ),
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

  _setController(TextEditingController controller, String controllerText) =>
      this.controller.text = controllerText;
}
