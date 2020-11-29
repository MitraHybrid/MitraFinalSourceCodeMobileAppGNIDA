import 'package:flutter/material.dart';

class CitizenButton extends StatelessWidget {

   final String title;
  final Function onPressed;
  final Color color;
  final double height;
  final double width;
 final Text text;

   CitizenButton(
      {this.title = '',
      @required this.onPressed,
      this.color =  Colors.blue,
      this.height,
      this.text,
      this.width});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF1976D2),
                  Color(0xFF1976D2),
                  Color(0xFF1976D2),
                ],
              )),
        height: height,
        width: width,
        margin: EdgeInsets.all(10),
        child: RaisedButton(
          
          child: Text(title, style: TextStyle(color: Colors.white, fontSize: 16.0,),),
          // shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.all(Radius.circular(38.0))),
          onPressed: this.onPressed(),
        ));
  }
 
 
}
