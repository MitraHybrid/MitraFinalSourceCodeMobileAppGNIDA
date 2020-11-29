import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navigationdrawer/Network/ApiResponse.dart';
import 'package:navigationdrawer/Utility/shared_preferences_util.dart';
import 'package:navigationdrawer/fragments/CitizenService/CitizenServiceType/CitizenServiceTypeModel.dart';
import 'package:navigationdrawer/fragments/CitizenService/CitizenServiceType/CitizenServiceType_MainBloc.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';
import 'package:navigationdrawer/fragments/CitizenService/Citizenfragment.dart';
import 'package:navigationdrawer/fragments/CommonService/ErrorMessage.dart';
import 'package:navigationdrawer/fragments/CommonService/Loading.dart';

class CitizenServicetype extends StatefulWidget {
  final String id;
 
  CitizenServicetype(this.id, {Key key}) : super(key: key);
  @override
  _CitizenServicetypeState createState() => _CitizenServicetypeState();
}

class _CitizenServicetypeState extends State<CitizenServicetype> {
  CitizenServiceType_MainBloc _bloc;

  bool isButtonPressed = false;
  bool viewVisible = false;

  TextEditingController controller = new TextEditingController();
  Future<ApiResponse> list;

  @override
  void initState() {
    _bloc = CitizenServiceType_MainBloc(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _apptitle(),
      body: RefreshIndicator(
          onRefresh: () => _bloc.fetchTypeService(widget.id),
          child: StreamBuilder<ApiResponse<CitizenServiceTypeModel>>(
              stream: _bloc.citizenTypeserviceStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data.status) {
                    case ApiStatus.Loading:
                      return Loading(loadingMessage: snapshot.data.message);
                      break;
                    case ApiStatus.Completed:
                      return CitizenserverMaingroup(
                        availablelist: snapshot.data.data,
                        id: widget.id,
                      );
                      break;
                    case ApiStatus.Error:
                      return ErrorMessage(
                        errorMessage: snapshot.data.message,
                        onRetryPressed: () => _bloc.fetchTypeService(widget.id),
                      );
                      break;
                  }
                }
                return Container();
              })),
    );
  }

  _apptitle() {
    return AppBar(title: Text("Citizen Service"));
  }
}

class CitizenserverMaingroup extends StatefulWidget {

  CitizenServiceTypeModel availablelist;

  String id;

  CitizenserverMaingroup({Key key, this.availablelist, this.id})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CitizenserverMaingroupState();
  }
}

class CitizenserverMaingroupState extends State<CitizenserverMaingroup> {
  bool isButtonPressed = false;
  bool viewVisible = true;
  String citizenType;
  String serviceArea;
  String ruralmatGroup;
   String urbanmatGroup;

  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    PreferenceUtils.init();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: new Column(children: <Widget>[
          new Container(
              padding: EdgeInsetsDirectional.only(start: 0, end: 0, top: 20.0),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[])),
          Container(child: Text("")),
          new Expanded(
            child: _searchResult.length != 0 || controller.text.isNotEmpty
                ? new ListView.builder(
                    itemCount: _searchResult.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        //onTap: () => _newTaskModalBottomSheet(context),
                        // _selectedItem(_searchResult[i].toString()),
                        child: Card(
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white),
                            child: new ListTile(
                                trailing: Icon(Icons.navigate_next,
                                    color: Colors.black87, size: 30.0),
                                title: new Text(_searchResult[i].toString(),
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ),
                      );
                    },
                  )
                : new ListView.builder(
                    itemCount: widget.availablelist.d.results.length,
                    itemBuilder: (context, index) {

                       
                      String activityDesc = widget
                          .availablelist.d.results[index].serviceArea
                          .toString();

                      String result = activityDesc[0].toUpperCase() +
                          activityDesc.substring(1).toLowerCase();


                      if (result != null && widget.availablelist!=null) {
                         
                           if (result == "Rural") {
                              result = "CitizenService-Rural";
                              ruralmatGroup =  widget.availablelist.d.results[0].matGroup.toString();  
                            } else {
                              result = "CitizenService-Urban";
                              urbanmatGroup =  widget.availablelist.d.results[1].matGroup.toString();
                            }
                          

                         
                        _userDetails.add(result);
                      }
                      print(result);
                      return GestureDetector(
                        onTap: () => _selectedItem(activityDesc),
                        child: Card(
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white),
                            child: new ListTile(
                                trailing: Icon(Icons.navigate_next,
                                    color: Colors.black87, size: 30.0),
                                title: new Text(result,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ]));
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {
        _userDetails.clear();
        _searchResult.clear();
      });
      return;
    }
    setState(() {
      _searchResult.clear();
      for (int i = 0; i < _userDetails.length; i++) {
        if (_userDetails[i].contains(text)) {
          print(_userDetails[i].toString());
          _searchResult.add(_userDetails[i].toString());
        }
      }
    });
  }

  List<String> _searchResult = [];
  List<String> _userDetails = [];

  _selectedItem(String activityDesc) {
    PreferenceUtils.setString(Preferences.citizenService, activityDesc);
    print("secondpref" + activityDesc);
    if(activityDesc == "URBAN"){
       PreferenceUtils.setString("MatGroup", urbanmatGroup);
     }else {
       PreferenceUtils.setString("MatGroup", ruralmatGroup);
     }

    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Citizenfragment(activityDesc)));
  }
}
