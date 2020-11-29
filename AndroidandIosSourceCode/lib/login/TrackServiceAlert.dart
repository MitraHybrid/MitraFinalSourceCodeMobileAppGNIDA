import 'package:flutter/material.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TrackServiceAlert extends StatefulWidget {

  @override
  _State createState() => _State();
}
 
class _State extends State<TrackServiceAlert> {
   final _text = TextEditingController();
 
 bool _validate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar:  _apptitle(),
                  body: Padding(
                      padding: EdgeInsets.all(10),
                      child: ListView(
                        children: <Widget>[
                         
                          Container(
                              margin: const EdgeInsets.only(top: 30.0,left:20.0,right: 20.0,bottom: 20.0),
                            padding: EdgeInsets.all(10),
                            child: TextField(
                             controller: _text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: Trackservice.tracknumber,
                                 errorText: _validate ? 'Value Can\'t Be Empty' : null,
                              ),
                            ),
                          ),
                         
                          Container(
                            height: 50,
                              margin: const EdgeInsets.only(top: 10.0,left:20.0,right: 20.0,bottom: 20.0),
                              child: RaisedButton(
                                textColor: Colors.white,
                                color: Colors.green,
                                child: Text(Trackservice.track),
                                onPressed: () {
                                   setState(() {
                                      _text.text.isEmpty ? _validate = true : _validate = false;
                                     });
                                },
                              )),
                              Container(
                                 margin: const EdgeInsets.only(top:0.0,left:20.0,right: 20.0,bottom: 20.0),
                                height: 50,
                                child: RaisedButton(
                                textColor: Colors.white,
                                color: Colors.green,
                                child: Text(Trackservice.feedback),
                                onPressed: () {
                                 setState(() {
                                   if( _text.text.isEmpty){
                                      FeedBackAlert();                                                    
                                  }
                                      //_text.text.isEmpty ? _validate = true : _validate = false;
                                                                           });
                                                                      },
                                                                    )),
                                                              ],
                                                            )));
                                                  }
                                                
                                                  _apptitle() {
                                                      return    AppBar(title: Text("Tracking Service"));
                                                  }
                                      
                Future<void> FeedBackAlert() async => Alert(
                           context: context,
                           type: AlertType.none,
                           title: Trackservice.alert,
                           desc: Trackservice.trackalertmess,
                           buttons: [
                     DialogButton(
                        child: Text(
                        Trackservice.cancel,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                               ),
                       onPressed: () => Navigator.pop(context),
                         )
                       ],
    ).show();
}
 