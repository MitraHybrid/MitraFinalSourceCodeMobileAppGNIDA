import 'package:flutter/material.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';

class ServiceHistory extends StatefulWidget {
 

  @override
  _State createState() => _State();
}
 
class _State extends State<ServiceHistory> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController _text = TextEditingController();
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Text(HOME.trackServices),
            ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
               
                Container(
                    margin: const EdgeInsets.only(top: 30.0,left:20.0,right: 20.0,bottom: 20.0),
                    padding: EdgeInsets.all(10),
                    child: TextField(
                     controller: _text  ,
                     decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ServicesHistory.mobilenumber,
                      errorText: _validate ? 'Please Enter The Valid Number' : null,

                    ),
                  ),
                ),
               
               
                    Container(
                       margin: const EdgeInsets.only(top:20.0,left:20.0,right: 20.0,bottom: 20.0),
                      height: 50,
                      child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      child: Text(FeedBack.submit),
                      onPressed:() {
                        if (_text.text.isEmpty ){
                                setState(() {
                                      _text.text.isEmpty ? _validate = true : _validate = false;
                                     });
                        }else{
                             
                        }
                       
                      },
                    )),
              ],
            )));
  }
}
 