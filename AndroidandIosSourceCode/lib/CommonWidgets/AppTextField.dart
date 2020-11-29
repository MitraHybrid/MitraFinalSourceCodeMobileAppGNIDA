import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {

  final Function onChange;
  final InputType type;
  final String textvalue;
  final String hinttext;
 
  AppTextField(
      {
      this.hinttext,
      this.textvalue ,
      this.onChange,
      this.type, 
    });

  @override
  Widget build(BuildContext context) {
    return RichText( 
        text: TextSpan(
        text: textvalue,
        style: TextStyle(fontSize: 16.0, color: Colors.black,fontWeight: FontWeight.w600),
        children: <TextSpan>[
          TextSpan(
                      text: hinttext,
                      style: TextStyle(
                      fontSize: 14.0, color: Colors.black,fontWeight: FontWeight.w600),
                    ),
    ],
  ),
        );
  }
}

enum InputType { email, password }
