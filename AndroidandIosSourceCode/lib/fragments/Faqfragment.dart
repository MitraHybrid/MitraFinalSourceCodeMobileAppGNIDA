import 'package:flutter/material.dart' ;
import 'package:flutter/widgets.dart';
import 'package:navigationdrawer/CommonWidgets/AppTextField.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';

class Faqfragment extends StatelessWidget {

   @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
        title: new Text('Faq'),
      ),
        body:SingleChildScrollView(
child: Stack(
    children: <Widget>[
       new   Container(
    padding: EdgeInsets.fromLTRB(5,20,5,20),
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.start,
        children:<Widget>[
          Container(
            padding: EdgeInsets.all(5),
         child: AppTextField(textvalue: Faq.citizenService,hinttext:Faq.citizenservicedetail),
          ),
          Divider(
             color: Colors.black,
             height: 36,
          ),

          Container(
                padding: EdgeInsets.all(5),
         child: AppTextField(textvalue: Faq.serviceavilable,hinttext:Faq.servicedetails,),
          ),
           Divider(
             color: Colors.black,
             height: 36,
          ), 
          Container(
                padding: EdgeInsets.all(5),
         child: AppTextField(textvalue: Faq.gpslocation,hinttext:Faq.gpsdetails,),
          ),
            Divider(
             color: Colors.black,
             height: 36,
          ),
           Container(
                padding: EdgeInsets.all(5),
         child: AppTextField(textvalue: Faq.pollutioncomplaint,hinttext:Faq.pollutiondetails,),
          ),
            Divider(
             color: Colors.black,
             height: 36,
          ),
           Container(
                padding: EdgeInsets.all(5),
         child: AppTextField(textvalue: Faq.usenamePassword,hinttext:Faq.usernamedetails,),
          ),
        ],
    )
  
)
    ]
         )
     ) );
  }
}