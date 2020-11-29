import 'package:flutter/material.dart';
import 'package:navigationdrawer/AuthorityUser/AuthorityLogin/forgotpassword.dart';

import 'package:navigationdrawer/Utility/MyConstants.dart';
import 'package:navigationdrawer/fragments/MarkMyAttendance/MarkMyDashboard.dart';

class MarkmyLogin extends StatefulWidget {
  @override
  _State createState() => _State();
}
 
  class _State extends State<MarkmyLogin> {
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
               new TextFormField(
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   hintText: "UserId",
                   labelText: "UserId"                   
                 ),
                 keyboardType: TextInputType.text,
                 validator: (val){
                     if (val.length == 0)
                       return "Please enter userId";                     
                    //  else if (!val.contains(""))
                    //    return "Please enter valid UserId";                     
                     else
                       return null; 
                   },
                   onSaved: (val)=>_email=val,
               ),
                SizedBox(height: 20),
               new TextFormField(
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   hintText: "Password",
                   labelText: "Password"                   
                 ),      
                 obscureText: true,          
                 validator: (val){
                     if (val.length == 0)
                       return "Please enter password";                     
                     else if (val.length <= 8)
                       return "Your password should be more then 9 char long";                     
                     else
                       return null; 
                   },
                   onSaved: (val)=>_password=val,
               ),
               new Padding(
                 padding: const EdgeInsets.only(top: 20.0),
               ),
               Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                 child: new Text("Submit",  style: TextStyle(fontSize: 14.0,color: Colors.white70),),
                 onPressed: (){
                   if (_formKey.currentState.validate()) {
                     _formKey.currentState.save();


                   Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MarkMyDashboard()),
              );

                    //  _scaffoldKey.currentState.showSnackBar(new SnackBar(
                    //    content: new Text("Your email: $_email and Password: $_password"),
                    //  ));
                   }
                 },
                 color: Colors.green,
                 highlightColor: Colors.blueGrey,                 
               )
                ),
                  SizedBox(height: 20),
                 Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                 child: new Text("Reset Password",  style: TextStyle(fontSize: 14.0,color: Colors.white70),),
                 onPressed: (){
                  //  if (_formKey.currentState.validate()) {
                  //    _formKey.currentState.save();

                      {
                   Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Forgotpassword()),
              );

                    //  _scaffoldKey.currentState.showSnackBar(new SnackBar(
                    //    content: new Text("Your email: $_email and Password: $_password"),
                    //  ));
                   }
                 },
                 color: Colors.green,
                 highlightColor: Colors.blueGrey,                 
               )
                ), ],
           ),
         );
   }
}                                                   
 