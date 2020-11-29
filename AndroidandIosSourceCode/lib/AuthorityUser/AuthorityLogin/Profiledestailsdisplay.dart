import 'package:flutter/material.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';

class Profiledestailsdisplay extends StatefulWidget {
  @override
  _State createState() => _State();
}
 
  class _State extends State<Profiledestailsdisplay> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _validate = false;
  String _email;
  String _password;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
            title: Text(HOME.authLogin),
            ),
             body: Container(
               child:SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
                 child:Center(
               child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                 formSetup(context)
               ],))),
    ));
           }
         
    Widget formSetup(BuildContext context){
     return new Form(
           key: _formKey,
           child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
             children: <Widget>[
               new Container(
                 
               ),
             
               ],
           ),
         );
   }
}                                                   
 