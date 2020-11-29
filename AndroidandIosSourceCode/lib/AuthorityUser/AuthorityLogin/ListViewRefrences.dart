import 'package:flutter/material.dart';
import 'package:navigationdrawer/AuthorityUser/AuthorityLogin/detailsRefrencesPage.dart';

class ListViewRefrences extends StatelessWidget { 
  // This widget is the root 
  // of your application. 
  @override 
  Widget build(BuildContext context) { 
    return new MaterialApp( 
      title: "Assigned ", 
      theme: new ThemeData( 
          primarySwatch: Colors.green 
      ), 
      debugShowCheckedModeBanner: false, 
      home: new ListViewBuilder() 
    ); 
  } 
} 
class ListViewBuilder extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title:Text("Assigned ") 
      ), 
      body: ListView.builder( 
        itemCount: 5, 
        itemBuilder: (BuildContext context,int index){ 
          return GestureDetector(
            onTap: () => _selectedItem(context),
                                    child: Card(
                                      child: Container(
                                        decoration: BoxDecoration(color: Colors.white),
                                        child: new   ListTile( 
                        leading: Icon(Icons.list), 
                        trailing: Text("", 
                                       style: TextStyle( 
                                         color: Colors.green,fontSize: 15),), 
                        title:Text("TRXCITZURBANMA") 
                                        )
                                        )
                                        )
                      );
                    } 
                    ), 
                ); 
              }
            
              _selectedItem(BuildContext context) {
                   Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsRefrencesPage()));

              } 
} 