import 'package:flutter/material.dart' ;
import 'package:flutter/widgets.dart';

class Paynow extends StatefulWidget {
     bool neeAppBar = true;
     String title ='Pay now';

Paynow({this.neeAppBar});

  @override
  _PaynowState createState() => _PaynowState();
}

class _PaynowState extends State<Paynow> {
   @override
  Widget build(BuildContext context) {
   
        return  Scaffold(
          appBar: widget.neeAppBar ? AppBar(
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back),
            //  onPressed: (){
            //     navigateToSubPage(context);
            //  }),
          ) : null,
       
        body: Center(child: Text('Paynow')));
  }

  // Future navigateToSubPage(BuildContext context) {
  //    Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationDrawer()));
  // }
}