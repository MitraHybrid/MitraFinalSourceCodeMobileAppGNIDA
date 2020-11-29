import 'package:flutter/material.dart';

class RaisedButtonl extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color color;
  final double height;
  final double width;
  final String route;
  final String id;

  

  RaisedButtonl(
      {this.title = '',
       this.color = Colors.blue,
      @required this.onPressed,
      this.id,
      this.route,    
      this.height,
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
              
              ),
             
              ),
        height: height,
        width: width,
        margin: EdgeInsets.all(10),
        child: FlatButton(
          child: Text(title, style: TextStyle(color: Colors.white, fontSize: 16.0,),),
          onPressed: ()=> this.onPressed(route,context,id),
        ));
  }
}
