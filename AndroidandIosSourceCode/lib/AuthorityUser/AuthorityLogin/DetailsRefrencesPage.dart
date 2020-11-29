import 'package:flutter/material.dart';
import 'package:navigationdrawer/CommonWidgets/AppTextField.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';

class DetailsRefrencesPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<DetailsRefrencesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(HOME.detailspage),
        ),
        body: DefaultTabController(
            length: 3,
            child: Scaffold(
                body: SafeArea(
                    child: Column(children: <Widget>[
              PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: TabBar(
                  labelColor: Colors.black,
                  tabs: [
                    Tab(
                      text: 'UserInfo',
                    ),
                    Tab(
                      text: 'Documents',
                    ),
                    Tab(
                      text: 'status',
                    )
                  ], // list of tabs
                ),
              ),
              //TabBarView(children: [ImageList(),])
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      margin: EdgeInsets.all(30),
                      child: Table(
                        //  border: TableBorder.all(),
                        children: [
                          TableRow(children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppTextField(
                                    hinttext: " P.P Mishra  ",
                                    textvalue: Trackservice.name,
                                  ),
                                ]),
                          ]),
                          TableRow(children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  AppTextField(
                                    hinttext: " P.P Mishra@gnida.com  ",
                                    textvalue: Allottee.email,
                                  ),
                                ]),
                          ]),
                          TableRow(children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  AppTextField(
                                    hinttext: " 78345657565  ",
                                    textvalue: Allottee.mobileNumber,
                                  ),
                                ]),
                          ]),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Center(child: Text('Documents')),
                    ),
                    // Container(
                    //   color: Colors.white,
                    //   child: Center(
                    //       child: Column(
                    //     children: <Widget>[
                    status(context),
                    //     ],
                    //   )),
                    // ) // class name
                  ],
                ),
              ),
            ])))));
  }

  Widget status(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return new SingleChildScrollView(
        child: Column(children: <Widget>[
      Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Container(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: FeedBack.suggestion,
                  hintText: FeedBack.suggestion,
                  contentPadding: const EdgeInsets.all(20.0)),
              autofocus: false,
            ),
          )),
     
     Container(
       margin: EdgeInsets.all(20.0),
       child: ButtonTheme(
        height: 60,
        minWidth: 200,
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Text(
            "Close",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {},
        ),
      ),
    )]));
  }
}
