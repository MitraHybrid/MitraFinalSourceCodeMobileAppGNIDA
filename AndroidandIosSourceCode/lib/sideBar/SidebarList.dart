

import 'package:flutter/material.dart';

class SidebarList extends StatelessWidget {
  final Function pickedOption;

  SidebarList({this.pickedOption});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
           appBar: new AppBar(
            title: new Text("Mitra"),
            automaticallyImplyLeading: false,
             actions: <Widget>[
           new IconButton(
             icon: new Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(null),
           ),
         ],
          ),
            body: ListView(
               padding: EdgeInsets.zero,
            children: <Widget>[
               DrawerHeader(
                 child: Text(''),
                 decoration: BoxDecoration(
                 image: DecorationImage(image:AssetImage('assets/images/mitracomp.jpg'),fit: BoxFit.none),
                 color: Colors.white,
        ),
               ),

        _createOption('Support', Icons.support, Menu.faq),
        Divider(),
        _createOption('Smog and PollutionComPlaint', Icons.poll, Menu.smog),
        Divider(),
        _createOption('Feedback and Rating', Icons.collections_bookmark, Menu.feedback),
        Divider(),
        _createOption('Mark my Attendance', Icons.art_track,Menu.markmyattendance),
        Divider(),
         _createOption('About Us', Icons.art_track,Menu.aboutus),
        Divider(),
        _createOption("SignOut", Icons.exit_to_app, Menu.signOut),
        Divider(),
        
      
      ],
    ));
   
  }

  _createOption(String title, IconData image, Menu menu) {
    return GestureDetector(
    
      child: ListTile(
           dense: true,
           leading: Icon(image, color: Colors.black),
           title: Text(title,
           style: new TextStyle(
           fontStyle: FontStyle.normal,
           color: Colors.black,
           fontWeight: FontWeight.bold,
                      fontSize: 14.0, ),
      ),
      onTap: () => this.pickedOption(menu),
    ));
    
  }
  
}

enum Menu {login,signOut,faq,customerservice,smog,feedback,aboutus,markmyattendance}

enum Class{feedbackalert}
