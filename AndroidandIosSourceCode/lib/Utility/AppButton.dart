import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color color;
  final double height;
  final double width;
  final String route;
  final String id;

  

  AppButton(
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
                  Colors.transparent,
                  Colors.transparent,
                 Colors.transparent,
                ],
              
              ),
             
              ),
        height: height,
        width: width,
      
        margin: EdgeInsets.all(10),
        child: FlatButton(
         shape: RoundedRectangleBorder(

  borderRadius: BorderRadius.circular(30.0),
  side: BorderSide(color: Colors.green)
),
          child: Text(title, style: TextStyle(color: Colors.black, fontSize: 16.0,),),
          onPressed: ()=> this.onPressed(route,context,id),
        ));
  }
}
