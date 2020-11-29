// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:http/http.dart';
// import 'package:payu_money_flutter/payu_money_flutter.dart';



// class PayU extends StatefulWidget {
//   @override
//   _PayUState createState() => _PayUState();
// }

// class _PayUState extends State<PayU> {

//    PayuMoneyFlutter payuMoneyFlutter = PayuMoneyFlutter();

//   // Payment Details
//   String phone = "8318045008";
//   String email = "gmail@gmail.com";
//   String productName = "My Product Name";
//   String firstName = "Vaibhav";
//   String txnID = "223428947";
//   String amount = "1.0";

//   @override
//   void initState() {
//     super.initState();
//     // Setting up the payment details
//     setupPayment();
//   }

//   // Function for setting up the payment details
//   setupPayment() async {
//     bool response = await payuMoneyFlutter.setupPaymentKeys(
//         merchantKey: "CA9nIRrB",
//         merchantID: "53HWzcRBbU",
//         isProduction: false,
//         activityTitle: "Mitra App",
//         disableExitConfirmation: false);
//   }

//   // Function for start payment with given merchant id and merchant key
//   Future<Map<String, dynamic>> startPayment() async {
//     // Generating hash from php server
//     Response res =
//         await post("https://PayUMoneyServer.codedivinedivin.repl.co", body: {
//       "txnid": txnID,
//       "phone": phone,
//       "email": email,
//       "amount": amount,
//       "productinfo": productName,
//       "firstname": firstName,
//     });
//     var data = jsonDecode(res.body);
//     print(data);
//     String hash = data['params']['hash'];
//     print(hash);
//     var myResponse = await payuMoneyFlutter.startPayment(
//         txnid: txnID,
//         amount: amount,
//         name: firstName,
//         email: email,
//         phone: phone,
//         productName: productName,
//         hash: hash);
//     print("Message ${myResponse}");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Payu Money Flutter'),
//         ),
//         body: Center(
//           child: Text("Pay Us 10"),
//         ),
//         floatingActionButton: FloatingActionButton(
//           // Starting up the payment
//           onPressed: () => startPayment(),
//           child: Icon(Icons.attach_money),
//         ),
//       ),
//     );
//   }
// }


