import 'package:flutter/material.dart' ;
import 'package:flutter/widgets.dart';

class FagPage extends StatefulWidget {

   FagPage ({Key key}) : super(key: key);
     @override
  _FagPageState createState() => _FagPageState();
  }


  
  @override
  State<StatefulWidget> createState() {
    return null;
  }

    class _FagPageState extends State<FagPage>{

       @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
      return LayoutBuilder(
        
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                  
                               ],         
            ),
          ),
        );
      },
    );
   }
  }
  
 

  
  


 
   


 
