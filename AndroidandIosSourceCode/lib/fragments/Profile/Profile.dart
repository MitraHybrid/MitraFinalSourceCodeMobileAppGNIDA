 import 'package:flutter/material.dart';

class Profile  extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Profile > {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:SingleChildScrollView(
        child:Row(
 mainAxisAlignment: MainAxisAlignment.center,

  children: <Widget>[
    new Flexible(
      child: new Text(
          "Allottment No :",
          style:TextStyle(color: Colors.black87,),
      ),
    ),
   
    new Flexible(
      child: new Text(
          "BHS1193684"  
      ),
    ),
    
  ],
),
        ) 
    );
  }
}