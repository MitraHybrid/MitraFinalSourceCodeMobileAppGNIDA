// import 'package:flutter/material.dart';
// import 'package:navigationdrawer/Utility/AppButton.dart';
// import 'package:navigationdrawer/Utility/MyConstants.dart';

// import 'package:navigationdrawer/fragments/LandingFragment.dart';

// class Homefragment extends StatefulWidget {

//   Homefragment({Key key }) : super(key: key);

//   @override
//   _HomefragmentState createState() => _HomefragmentState();
// }

// class _HomefragmentState extends State<Homefragment> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//         body: new SingleChildScrollView(
//             child: Center(
//       child: Center(
//         child: Container(
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 HOME.title,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18.0,
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(16.0),
//                 child: Image.asset('assets/images/mitracomp.jpg'),
//               ),
//               AppButton(
//                   id: 'CitizenService',
//                   width: size.width * 0.7,
//                   height: size.height * 0.08,
//                   onPressed: (route, count, id) =>
//                       this._clicked(route, context, id),
//                   route: '/citizenservice',
//                   title: HOME.citizenUrban),
//               // AppButton(
//               //     id: 'Rural',
//               //     width: size.width * 0.7,
//               //     height: size.height * 0.08,
//               //     onPressed: (route, count, id) =>
//               //         this._clicked(route, context, id),
//               //     route: '/citizenservice',
//               //     title: HOME.citizenRural),
//               Text(
//                 HOME.loginMessage,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontStyle: FontStyle.normal,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   decorationStyle: TextDecorationStyle.wavy,
//                   fontSize: 18.0,
//                 ),
//               ),
//               AppButton(
//                 id: 'allotee',
//                 width: size.width * 0.7,
//                 height: size.height * 0.08,
//                 onPressed: (route, count, id) =>
//                     this._clicked(route, context, id),
//                 route: '/allotte',
//                 title: HOME.allotee,
//               ),
//               AppButton(
//                 id: 'authorityUser',
//                 width: size.width * 0.7,
//                 height: size.height * 0.08,
//                 onPressed: (route, count, id) =>
//                     this._clicked(route, context, id),
//                 route: '/login',
//                 title: HOME.authorityUser,
//               )
//             ],
//           ),
//         ),
//       ),
//     )));
//   }

//   _clicked(route, context, id) {
    
//     Navigator.pushNamed(context, route, arguments: id);
//   }

//   void _serviceCall(id) {
//     switch (id) {
//       case 'Urban':
//         Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => Citizenfragment('%27SER_UBMNT%27')));
//         break;
//       case 'Rural':
//         Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => Citizenfragment('%27SER_RRMNT%27')));
//         break;
//       case 'citizenservice':
//         Navigator.of(context).push(
//             MaterialPageRoute(builder: (context) => LandingFragment()));
//         break;
//       default:
//         break;
//     }
//   }
// }

// enum Type { one, two, three }
