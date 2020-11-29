import 'package:flutter/material.dart';
import 'package:navigationdrawer/CommonWidgets/SpanText.dart';
import 'package:navigationdrawer/Utility/AppButton.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';


class Allotte extends StatefulWidget {
  @override
  _State createState() => _State();
}
 
class _State extends State<Allotte> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var _currencies = ['Industrial', 'Institutional', 'Residential', 'Commercial','IT Biotech','Builders','Group Housing'];
	var _currentItemSelected = 'Industrial';
 

 @override
  void initState() {
    super.initState();
   
  }

 
 
  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return Scaffold(
       appBar: AppBar(
            title: Text(HOME.login),
            ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      HOME_TITLE,
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),

                    Container(
                     alignment: Alignment.center,
                     padding: EdgeInsets.all(10),
                     child:  DropdownButton<String>(
                     isExpanded: true,
                     items: _currencies.map((String dropDownStringItem) {
					          	return DropdownMenuItem<String>(
							        value: dropDownStringItem,
							        child: Text(dropDownStringItem),
                   
						    );
                
					    }
              ).toList(),
            
					    onChanged: (String newValueSelected) {
					    	// Your code to execute, when a menu item is selected from drop down
						    _onDropDownItemSelected(newValueSelected);
					    },
              hint: Text('DropdownButton Hint'),
					    value: _currentItemSelected,

				    ),
            ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: LOGIN.allotNo,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: LOGIN.password,
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.green,
                  child: Text(''),
                ),
                Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      child: Text('Login'),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                      },
                    )),
                                       
                 Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child:SpanText(textvalue:ServicesHistory.note,hinttext: ServicesHistory.allotepasshit),
                     ),
                    
                Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child:SpanText(textvalue:ServicesHistory.note,hinttext:ServicesHistory.allotereghit)
                    ),
                Container(
                 padding: EdgeInsets.fromLTRB(30, 20, 20, 0),
                 child:  AppButton( id:'PdfDownloader',
                      width: size.width * 0.5,
                      height: size.height * 0.05,
                      onPressed: (route, count,id) => this._clicked(route, context,id),
                                            route: '/PdfDownloader',
                                            title:LOGIN.download),
                  )  ],
                                    
                                  )
                                  
                                  )
                                  );
                        }
                      
  _clicked(route, context,id) {
          print(route);
          print(id);
          Navigator.pushNamed(context, route,);
        }   
   void _onDropDownItemSelected(String newValueSelected) {
	  setState(() {
		  this._currentItemSelected = newValueSelected;
	  });
  }
}
 