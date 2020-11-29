import 'package:flutter/material.dart' ;
import 'package:flutter/widgets.dart';

class ReopenComplaint extends StatefulWidget {
     bool neeAppBar = true;
     String title ='Pay now';

ReopenComplaint({this.neeAppBar});

  @override
  _ReopenComplaintState createState() => _ReopenComplaintState();
}

class _ReopenComplaintState extends State<ReopenComplaint> {
   @override
  Widget build(BuildContext context) {
   
        return  Scaffold(
          appBar: widget.neeAppBar ? AppBar(
          ) : null,
       
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
               
              ],
            ),
          ),
        
      
          ),
        )
        );
  }
}