import 'package:flutter/material.dart';

class SpanText extends StatelessWidget {

  final Function onChange;
  final InputType type;
  final String textvalue;
  final String hinttext;
 
  SpanText(
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
        style: TextStyle(fontSize: 14.0, color: Colors.red,fontWeight: FontWeight.w600),
        children: <TextSpan>[
          TextSpan(
                     text: hinttext,
                      style: TextStyle(
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontSize: 14, height: 1.5 ,
                      color: Colors.black),
                    ),
    ],
  ),
        );
  }
}

enum InputType { email, password }
