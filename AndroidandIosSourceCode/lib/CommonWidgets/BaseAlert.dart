import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseAlert extends StatelessWidget {
  final Widget child;
  final double minHeight;
  final double maxHeight;
  BaseAlert({@required this.child, this.maxHeight = 310, this.minHeight = 100});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 18.7, right: 18.7, top: 18.7, bottom: 18.7),
      decoration: new BoxDecoration(
        color: Colors.transparent,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: this.minHeight, maxHeight: this.maxHeight),
      
          child: Container(
              child: Container(
              color: Colors.red,
              width: maxHeight,
              height: maxHeight,
              child: Text("welcome",textAlign: TextAlign.center,style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
        ),
        ),
        
       
         ),
       
          
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue,
                  offset: Offset(0, 2),
                  blurRadius: 8,
                  spreadRadius: 0,
                )
              ],
            ),
          ),
        
        ),
      ),
      
    );
    
  }
}
