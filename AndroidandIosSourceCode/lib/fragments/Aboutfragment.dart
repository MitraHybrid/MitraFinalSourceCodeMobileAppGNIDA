import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:navigationdrawer/CommonWidgets/DisplayItem.dart';
import 'package:navigationdrawer/fragments/NavigationDrawer.dart';

class Aboutfragment extends StatefulWidget {
  @override
  AboutFragmentState createState() => AboutFragmentState();
}

TabController _tabController;
GoogleMapController mapController;
final LatLng _center = const LatLng(28.474388, 77.503990);
void _onMapCreated(GoogleMapController controller) {
  mapController = controller;
}

class AboutFragmentState extends State<Aboutfragment> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: Text(
                "GNIDA",
              ),
            ),
            body: DefaultTabController(
                length: 3,
                child: Scaffold(
                  body: SafeArea(
                    child: Column(
                      children: <Widget>[
                        PreferredSize(
                          preferredSize: Size.fromHeight(50.0),
                          child: TabBar(
                            controller: _tabController,
                            indicatorColor: Colors.green,
                            labelColor: Colors.red,
                            unselectedLabelColor: Colors.grey,

                            tabs: [
                              Tab(
                                text: 'ContactUs',
                                icon: Icon(Icons.contact_mail),
                              ),
                              Tab(
                                text: 'Location',
                                icon: Icon(Icons.location_on),
                              ),
                              Tab(
                                text: 'Photo',
                                icon: Icon(Icons.photo_album),
                              ),
                            ], // list of tabs
                          ),
                        ),
                        //TabBarView(children: [ImageList(),])
                        Expanded(
                          child: TabBarView(children: [
                            Container(
                              child: ListView.builder(
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        DisplayItem(data[index]),
                                itemCount: data.length,
                              ),
                              color: Colors.white,
                            ),
                            Container(
                              child: GoogleMap(
                                onMapCreated: _onMapCreated,
                                initialCameraPosition: CameraPosition(
                                  target: _center,
                                  zoom: 12.0,
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              child: Center(child: Text("Photo details")),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ))));
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16),
              new GestureDetector(
                onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => NavigationDrawer()),
                    ModalRoute.withName("/NavigationDrawer")),
                child: Text("YES"),
              ),
            ],
          ),
        ) ??
        false;
  }
}
