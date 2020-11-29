import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final Function onChange;
  final InputType type;
  final String errorText;

  AppInput(
      {this.hintText,
      this.labelText,
      this.controller,
      this.onChange,
      this.type,
      this.errorText = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: labelText,
              hintText: hintText,
              errorText: this.errorText),
          autofocus: false,
          controller: controller,
          onChanged: (text) => onChange(text, type),
        ));
  }
}

enum InputType { email, password }
