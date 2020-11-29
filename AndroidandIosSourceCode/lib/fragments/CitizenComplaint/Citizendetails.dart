import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:navigationdrawer/CommonWidgets/AppTextField.dart';
import 'package:navigationdrawer/Network/ApiResponse.dart';
import 'package:navigationdrawer/Utility/AppButton.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navigationdrawer/Utility/shared_preferences_util.dart';
import 'package:navigationdrawer/fragments/CitizenComplaint/ComplaintRequest.dart';
import 'package:navigationdrawer/fragments/CitizenService/ConcernPerson/CitizenServiceConcPerson_MainBloc.dart';
import 'package:navigationdrawer/fragments/CitizenService/ConcernPerson/ConcernPersonModel.dart';
import 'package:navigationdrawer/fragments/CommonService/ErrorMessage.dart';
import 'package:navigationdrawer/fragments/CommonService/Loading.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import '../NavigationDrawer.dart';

class CitizenSectorDetails extends StatefulWidget {
  final String sectorID;
  CitizenSectorDetails(this.sectorID, {Key key}) : super(key: key);
  @override
  _CitizenSectorDetailsState createState() => _CitizenSectorDetailsState();
}

@override
State<StatefulWidget> createState() {
  return null;
}

class _CitizenSectorDetailsState extends State<CitizenSectorDetails> {
  CitizenServiceConcPerson_MainBloc _conbloc;
  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _conbloc = CitizenServiceConcPerson_MainBloc(widget.sectorID);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: _apptitle(widget.id),
      body: RefreshIndicator(
          onRefresh: () => _conbloc.fetchConcerpersonDetails(widget.sectorID),
          child: StreamBuilder<ApiResponse<ConcernPersonModel>>(
              stream: _conbloc.citizenConcerPersonStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data.status) {
                    case ApiStatus.Loading:
                      return Loading(loadingMessage: snapshot.data.message);
                      break;
                    case ApiStatus.Completed:
                      return Citizendetails(
                        availableSector: snapshot.data.data,
                      );
                      break;
                    case ApiStatus.Error:
                      return ErrorMessage(
                        errorMessage: snapshot.data.message,
                        onRetryPressed: () =>
                            _conbloc.fetchConcerpersonDetails(widget.sectorID),
                      );
                      break;
                  }
                }
                return Container();
              })),
    );
  }

  _apptitle(String obj) {
    //   if (widget.id == '%27SER_UBMNT%27') {
    //     return AppBar(title: Text("Citizen Service-Urban"));
    //   } else {
    //     return AppBar(title: Text("Citizen Service-Rural"));
    //   }
  }
}

// ignore: must_be_immutable
class Citizendetails extends StatefulWidget {
  ConcernPersonModel availableSector;

  Citizendetails({Key key, this.availableSector}) : super(key: key);

  @override
  _CitizendetailsState createState() => _CitizendetailsState();
}

var username = 'GNIDA-MOB';
var password = 'sap@mob1';
Future<ComplaintRequest> complaintRaised(String body, BuildContext context) async {
  final String apiUrl = Post_service_URL;
  var basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));

  final response = await http.post(apiUrl,
      headers: <String, String>{
        'Authorization': basicAuth,
        'Content-Type': 'application/json',
        'X-CSRF-TOKEN': 'Fetch',
        'X-Requested-With': 'X',
        'sap-client': '830'
      },
      body: body);
  print(response.body.toString());
  if (response.statusCode == 201) {
   
     Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            NavigationDrawer()));

    return complaintRequestFromJson(json.decode(response.body.toString()));
  } else {
    return null;
  }
}

class _CitizendetailsState extends State<Citizendetails> {
  ComplaintRequest _user;

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String name, email, mobile, desc;

  File _image;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;
  String subGroupValue;
  String sectorList;
  String personMobile;
  String personname;
  String designation;
  String designationResult;
  List<String> selectedItemValue = List<String>();
  bool _visible = false;

  TextEditingController controller;
    final TextEditingController _username = new TextEditingController();
    final TextEditingController _mobileNumber = new TextEditingController();
    final TextEditingController _emailAddress = new TextEditingController();
    final TextEditingController _desc = TextEditingController();
      final TextEditingController _location = TextEditingController();
    

  @override
  void initState() {
    super.initState();
    PreferenceUtils.init();
    controller = TextEditingController();
    subGroupValue = PreferenceUtils.getString("ServiceList");
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      this.ShowAlert(subGroupValue);
      _getCurrentLocation();

      setState(() {
        personMobile = widget.availableSector.d.concernMobile.toString();
        personname = widget.availableSector.d.concernName.toString();
        designation = widget.availableSector.d.concernDesignation.toString();
          designationResult = designation[0].toUpperCase() +
                          designation.substring(1).toLowerCase();
        print(personMobile + personname + "Designation "+designationResult);
      });
    });

    if (_currentAddress != null) {
      Text(_currentAddress);
    }
  }

  void opencamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  void opengallery() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(HOME_TITLE)),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(
                          top: 20.0, left: 20.0, right: 20.0),
                      child: Text("Raising Complaint under selected Catogery",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.red)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 5.0, left: 20.0, right: 20.0),
                      child: Text(
                          "Selected ServiceList :"  +
                              PreferenceUtils.getString("ServiceList"),
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 5.0, left: 20.0, right: 20.0),
                      child: Text(
                          "Selected Sector :" +
                              PreferenceUtils.getString("Sectordesc"),
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      margin: new EdgeInsets.all(20.0),
                      child: new Form(
                          key: _key, autovalidate: _validate, child: FormUI()),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  void customizedAlert() {
    var alert = Alert(
      context: context,
      title: "Upload Image",
      type: AlertType.none,
      buttons: [
        DialogButton(
            child: Text(
              CitizenDetailstext.camera,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
               _visible = true ;
              opencamera();
              Navigator.of(context).pop();
            }),
        DialogButton(
            child: Text(
              CitizenDetailstext.gallery,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
               _visible = true ;
              opengallery();
            })
      ],
    );
    alert.show();
  }

  void sctorAreaAlert(id) {
    var alert = Alert(
      context: context,
      title: id,
      type: AlertType.none,
      buttons: [
        DialogButton(
            child: Text(
              CitizenDetailstext.ok,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
    alert.show();
  }

  void _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  void _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.name},${place.subAdministrativeArea},${place.subLocality},${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  selected(route, context, id) {
    setState(() {
     
      alert(id);
    });
  }

  void alert(id) {
    switch (id) {
      case 'sitePhotoUpload':
        customizedAlert();
        break;
      case 'Uploaddocument':
        customizedAlert();
        break;
    }
  }

  // ignore: non_constant_identifier_names
  ShowAlert(String subGroupValue) async {
    if (subGroupValue != null) {
      sctorAreaAlert(subGroupValue);
    }
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      // No any error in validation

      _key.currentState.save();
      String sectorId = PreferenceUtils.getString("SectorId");
      String activityId = PreferenceUtils.getString("activityId");
      String matGroup = PreferenceUtils.getString("MatGroup");
      String citizenservice = PreferenceUtils.getString("CitizenAService");
      String citizenType = PreferenceUtils.getString("CitizenType");
      String subgroupId = PreferenceUtils.getString("SubgroupId");

      print("MainServID $citizenType");
      print("ServiceArea $citizenservice");
      print("SubgroupId $subgroupId");
      print("sectorId $sectorId");
      print("activityId $activityId");
      print("MatGroup $matGroup");
      print("custName $name");
      print("custMobile $mobile");
      print("custEmailId $email");
      print("CustAddress$_currentAddress");
      print("compDesc $desc");
      print("ConpersonName $personname");
      print("Conpersonmobile $personMobile");
      Map data = {
        "d": {
          "MainServID": citizenType,
          "ServiceArea": citizenservice,
          "SubgroupID": subgroupId,
          "SectorID": sectorId,
          "ActivityID": activityId,
          "MatGroup": matGroup,
          "CustName": name,
          "CustMobile": mobile,
          "CustEmail": email,
          "CustAddress": _currentAddress,
          "CompDesc": desc,
          "ConsPerName": personname,
          "ConsPerMobile": personMobile,
          "ReqDate": "26072020"
        }
      };
      String body = json.encode(data);
      setState(() {
        postrequest(body,context);
      });

      // PostComplaint complaint = new PostComplaint();
      // complaint.d.mainServID = citizenType;
      // complaint.d.activityID = activityId;
      // var body = json.encode(complaint);
      print(data);
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }

  Widget FormUI() {
    
        return new Column(
          children: <Widget>[
            new TextFormField(
              controller: _username,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: CitizenDetailstext.entername,
                  labelText: CitizenDetailstext.entername,
                  suffixIcon: _username.text.isNotEmpty? Padding(
                    padding: const EdgeInsetsDirectional.only(start: 12.0),
                    child: IconButton(
                      iconSize: 18.0,
                      icon: Icon(Icons.cancel, color: Colors.black,),
                      onPressed: () {
                        setState(() {
                          _username.clear();
                        });
                      },
                    ),
                  )
                : null,),
                                 maxLength: 32,
                                 validator: validateName,
                                 onSaved: (String val) {
                                   name = val;
                                 },
                               ),
                               new TextFormField(
                                   controller: _mobileNumber,
                                   decoration: new InputDecoration(
                                     border: OutlineInputBorder(),
                                     labelText: CitizenDetailstext.mobilenumber,
                                     hintText: CitizenDetailstext.mobilenumber,
                                     suffixIcon: _mobileNumber.text.isNotEmpty? Padding(
                                      padding: const EdgeInsetsDirectional.only(start: 12.0),
                                       child: IconButton(
                                       iconSize: 18.0,
                                       icon: Icon(Icons.cancel, color: Colors.black,),
                                       onPressed: () {
                                         setState(() {
                                        _mobileNumber.clear();
                                              });
                                           },
                                         ),
                                        )
                                           : null, ),
                                                                        keyboardType: TextInputType.phone,
                                                                        maxLength: 10,
                                                                       validator: validateMobile,
                                                                        onSaved: (String val) {
                                                                          mobile = val;
                                                                        }),
                                                                    new TextFormField(
                                                                       controller: _emailAddress,
                                                                        decoration: InputDecoration(
                                                                          border: OutlineInputBorder(),
                                                                          labelText: CitizenDetailstext.emailaddress,
                                                                          hintText: CitizenDetailstext.emailaddress,
                                                                           suffixIcon: _emailAddress.text.isNotEmpty? Padding(
                                                                           padding: const EdgeInsetsDirectional.only(start: 12.0),
                                                                            child: IconButton(
                                                                            iconSize: 18.0,
                                                                            icon: Icon(Icons.cancel, color: Colors.black,),
                                                                         onPressed: () {
                                                                            setState(() {
                                                                           _emailAddress.clear();
                                                                                      });
                                                                                   },
                                                                                  ),
                                                                        )
                                                                        : null,
                                                                        ),
                                                                        keyboardType: TextInputType.emailAddress,
                                                                        maxLength: 32,
                                                                        validator: validateEmail,
                                                                        onSaved: (String val) {
                                                                          email = val;
                                                                        }),
                                                                    Container(
                                                                      child: TextFormField(
                                                                        controller: _location,
                                                                        keyboardType: TextInputType.multiline,
                                                                        maxLines: 5,
                                                                        decoration: InputDecoration(
                                                                          border: OutlineInputBorder(),
                                                                          hintText: _currentAddress,
                                                                          suffixIcon: _location.text.isNotEmpty? Padding(
                                                                           padding: const EdgeInsetsDirectional.only(start: 12.0),
                                                                            child: IconButton(
                                                                            iconSize: 18.0,
                                                                            icon: Icon(Icons.cancel, color: Colors.black,),
                                                                         onPressed: () {
                                                                            setState(() {
                                                                           _location.clear();
                                                                                      });
                                                                                   },
                                                                                  ),
                                                                        )
                                                                        : null,
                                                                        ),
                                                                        autofocus: false,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: const EdgeInsets.only(
                                                                        top: 20.0,
                                                                      ),
                                                                      child: TextFormField(
                                                                        controller: _desc,
                                                                        keyboardType: TextInputType.multiline,
                                                                        maxLines: 5,
                                                                        decoration: InputDecoration(
                                                                          border: OutlineInputBorder(),
                                                                          labelText: CitizenDetailstext.complaint,
                                                                          hintText: CitizenDetailstext.complaint,
                                                                           suffixIcon: _desc.text.isNotEmpty? Padding(
                                                                           padding: const EdgeInsetsDirectional.only(start: 12.0),
                                                                            child: IconButton(
                                                                            iconSize: 18.0,
                                                                            icon: Icon(Icons.cancel, color: Colors.black,),
                                                                         onPressed: () {
                                                                            setState(() {
                                                                           _desc.clear();
                                                                                      });
                                                                                   },
                                                                                  ),
                                                                        )
                                                                        : null,
                                                                          
                                                                        ),
                                                                        autofocus: false,
                                                                        validator: validateDesc,
                                                                        onSaved: (String val) {
                                                                          desc = val;
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Visibility(
                                                                     visible: _visible,
                                                                     
                                                                      child: Column(
                                                                        children: [
                                                                          
                                                                          Container(
                                                                              margin: const EdgeInsets.only(
                                                                        top: 20.0,
                                                                      ),
                                                                            color: Colors.black12,
                                                                            height: 300.0,
                                                                            width: 900.0,
                                                                            child: _image == null
                                                                                ? Text("Please select Photo or document Option!")
                                                                                : Image.file(_image),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                                      AppButton(
                                                                        id: "sitePhotoUpload",
                                                                        title: CitizenDetailstext.sitephoto,
                                                                        onPressed: ((route, context, id) => {
                                                                              this.selected(route, context, id),
                                                                            }),
                                                                      ),
                                                                      AppButton(
                                                                        id: "Uploaddocument",
                                                                        title: CitizenDetailstext.uploaddocument,
                                                                        onPressed: ((route, context, id) => {
                                                                              this.selected(route, context, id),
                                                                            }),
                                                                      )
                                                                    ])),
                                                                    Text(CitizenDetailstext.concerndDetails,
                                                                    style: TextStyle(color: Colors.red,fontSize:18),),
                                                                    Container(
                                                                       height: 100,
                                                                       margin: const EdgeInsets.only(
                                                                        top: 10.0,),
                                                                     decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                             
                                                                              borderRadius: BorderRadius.circular(10), //border corner radius
                                                                              boxShadow:[ 
                                                                                     BoxShadow(
                                                                                     color: Colors.grey.withOpacity(0.5), //color of shadow
                                                                                     spreadRadius: 5, //spread radius
                                                                                     blurRadius: 7, // blur radius
                                                                                     offset: Offset(0, 2), // changes position of shadow
                                                                                   ),
                                                                                     ],),
                                                                      child: new Column(
                                                                         crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                        children: [
                                                                         //  AppTextField(textvalue: CitizenDetailstext.concerndDetails,),
                                                                          AppTextField(
                                                                            hinttext: designationResult,
                                                                            textvalue: CitizenDetailstext.designation,
                                                                      ),
                                                                      AppTextField(
                                                                        hinttext: personname,
                                                                        textvalue: CitizenDetailstext.conName,
                                                                      ),
                                                                      AppTextField(
                                                                        hinttext: personMobile,
                                                                       textvalue: CitizenDetailstext.conmobile,
                                                                      ),
                                                                      AppTextField(
                                                                          textvalue: CitizenDetailstext.requestdate,
                                                                          hinttext: CitizenDetailstext.condate),
                                                                    ],
                                                                  ),
                                                                ),
                                                                 SizedBox(   //Use of SizedBox 
                                                                        height: 20, 
                                                                      ), 
                                                                Container(
                                                                    child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                      RaisedButton(
                                                                        color: Colors.green,
                                                                        child: new Text(CitizenDetailstext.clear, 
                                                                        style: TextStyle(color: Colors.white,fontSize:16),),
                                                                        onPressed:  _clearData,
                                                                      
                                                                            ),
                                                                       RaisedButton(
                                                                        color: Colors.green,
                                                                        child: new Text(CitizenDetailstext.submit,
                                                                         style: TextStyle(color: Colors.white,fontSize: 16),),
                                                                           onPressed: _sendToServer,
                                                                              )
                                                                               ])),
                                                                              ],
                                                                            );
                                                                          }
                                                                        
                                                                          Future<void> postrequest(String body, BuildContext context) async {
                                                                            //CitizenServiceSubGroupMainBloc _subgroupbloc = new CitizenServiceSubGroupMainBloc(null);
                                                                            final ComplaintRequest user = await complaintRaised(body,context);
                                                                            setState(() {
                                                                              _user = user;
                                                                              print(_user);
                                                                            });
                                                                          }
                                                                        
                                                                          void _clearData() {
                                                                              
                                                                       }
}                                      
                   
                 
