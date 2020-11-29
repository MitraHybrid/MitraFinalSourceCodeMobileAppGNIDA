import 'package:flutter/material.dart' ;
import 'package:flutter/widgets.dart';
import 'package:navigationdrawer/Utility/AppButton.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Feedbackfragment extends StatefulWidget{

FeedbackfragmentWidget  createState() => FeedbackfragmentWidget();

}

class FeedbackfragmentWidget extends  State {
  double rating = 3 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(FeedBack.feedback),
            ),
      
     body: Center(
       child: RatingBar()
              )
              );
       }
       }
       
       class RatingBar extends StatefulWidget {

         RatingBarWidget createState() => RatingBarWidget();
}

class RatingBarWidget extends State {
 
double rating = 3 ;
@override
Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

return Scaffold(
  body: SingleChildScrollView(
    child: Center(
    child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text (FeedBack.feedbackreopen
            ,style: TextStyle(fontSize:20))),
 
        SmoothStarRating(
          allowHalfRating: false,
          onRatingChanged: (value) {
            setState(() {
              rating = value ;
            });
          },
          starCount: 5,
          rating: rating,
          size: 40.0,
          color: Colors.green,
          borderColor: Colors.green,
          spacing:0.0,           
        ),
      Container(
           margin: const EdgeInsets.only(top:20.0,left:20.0,right: 20.0,),
                         child: TextField(
                         keyboardType: TextInputType.multiline,
                         maxLines: 5,
                         decoration: InputDecoration(
                         border: OutlineInputBorder(),
                         labelText:FeedBack.writeyoufeedback,
                         hintText:FeedBack.writeyoufeedback,
                       ),
                       autofocus: false,
      )),
       Container(
           margin: const EdgeInsets.only(top:20.0,left:20.0,right: 20.0,),
                         child: TextField(
                         keyboardType: TextInputType.multiline,
                         maxLines: 5,
                         decoration: InputDecoration(
                         border: OutlineInputBorder(),
                         labelText:FeedBack.suggestion,
                         hintText:FeedBack.suggestion,
                       ),
                       autofocus: false,
      ),
      
      ),
      Container(
          margin: const EdgeInsets.only(top:20.0,left:20.0,right: 20.0,),

    child:AppButton(
                 id: 'feedback',
                 width: size.width * 0.7,
                 height: size.height * 0.1,
                 onPressed: (route, count,id) => this._clicked(route, context,id),
                 route: '/submit',
                 title: HOME.allotee,
                                                     ),),
                         ],
                     ),
                   )));
                 }
                 
                   _clicked(route, BuildContext context, id) {
                     
                   }
}