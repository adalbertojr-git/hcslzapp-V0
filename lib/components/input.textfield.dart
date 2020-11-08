import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String tip;
  final IconData icon;
  final TextInputType inputType;
  final bool hidden;
  final bool disabled;
  final String prefix;
  final int nLines;
  String valor;
  final double size;

  InputTextField(
      {this.controller,
      this.label,
      this.tip,
      this.icon,
      this.inputType,
      this.hidden,
      this.disabled,
      this.prefix,
      this.valor,
      this.nLines,
      this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        obscureText: hidden != null ? hidden : false,
        readOnly: disabled != null ? disabled : false,
        controller: controller,
        style: TextStyle(
          fontSize: size != null ? size : 15.0,
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
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
          filled: true,
          labelText: valor,
          hintText: tip,
          prefixText: prefix,
          helperText: label,
          helperStyle: TextStyle(fontSize: 10.0, color: Colors.black54),
        ),
        keyboardType: inputType,
        onSaved: (String value) {
          valor = value;
          print('name=$valor');
        },
        validator: (value) {},
        maxLines: nLines != null ? nLines : 1,
      ),
    );
  }

  String _validateName(String value) {
    if (value.isEmpty) return 'Nome is obrigatorio.';
    final RegExp nomeExp = RegExp(r'^[A-Za-z ]+$');
    if (!nomeExp.hasMatch(value))
      return 'Favor digitar somente caracteres alfabeticos.';
    return null;
  }
}
