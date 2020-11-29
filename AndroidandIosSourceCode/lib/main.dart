import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navigationdrawer/Allottee/Allotte.dart';
import 'package:navigationdrawer/Authentication/Authentication.dart';
import 'package:navigationdrawer/fragments/ExpansionTileSample.dart';
import 'package:navigationdrawer/fragments/Feedbackfragment.dart';
import 'package:navigationdrawer/fragments/MarkMyAttendance/MarkmyLogin.dart';
import 'package:navigationdrawer/fragments/NavigationDrawer.dart';
import 'package:navigationdrawer/fragments/PDFDownloader.dart';
import 'package:navigationdrawer/fragments/SignOut.dart';
import 'package:navigationdrawer/fragments/smogandpollution/smollandpollutiondetail.dart';
import 'package:navigationdrawer/login/HomePage.dart';
import 'package:navigationdrawer/AuthorityUser/AuthorityLogin/AuthorityLogin.dart';
import 'package:navigationdrawer/login/ServiceHistory.dart';
import 'package:navigationdrawer/login/TrackServiceAlert.dart';

import 'fragments/Aboutfragment.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: new SplashScreen(),
      //  initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      //  home:Authentication(),
      routes: {
        '/Authentication': (context) => Authentication(),
        '/about': (context) => Aboutfragment(),
       // '/faq': (context) => Faqfragment(),
         '/faq': (context) => ExpansionTileSample(),
        // '/googlemap':(context) => AboutScreen(),
         //'/citizenservice': (context) => CitizenServicetype(""),
        '/Feedback': (context) => Feedbackfragment(),
        '/smogandpollution': (context) => Smollandpollutiondetail(),
        '/login': (context) => Login(),
        '/allotte': (context) => Allotte(),
        '/trackservice': (context) => TrackServiceAlert(),
        '/ServiceHistory': (context) => ServiceHistory(),
       // '/Citizendetails': (context) => Citizendetails(),
        '/homepage': (context) => HomePage(),
        '/PdfDownloader': (context) => PDFDownloader(),
        '/Aboutfragment': (context) => Aboutfragment(),
        '/MarkmyLogin' :(context) => MarkmyLogin(),
        '/signOut':(context)=> SignOut(),
        '/NavigationDrawer' :(context)=> NavigationDrawer(),
        // '/PayU' :(context)=> PayU()
       // '/CitizenserviceType': (context) => CitizenserviceType()
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/Authentication');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset('assets/images/mitracomp.jpg'),
      ),
    );
  }

}


      
     


  
     


  
 



