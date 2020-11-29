import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navigationdrawer/Network/ApiResponse.dart';
import 'package:navigationdrawer/Utility/shared_preferences_util.dart';
import 'package:navigationdrawer/fragments/BaseService/BaseServiceModel.dart';
import 'package:navigationdrawer/fragments/CitizenService/CitizenServiceList/CitizenServiceList_MainBloc.dart';
import 'package:navigationdrawer/fragments/CitizenService/CitizenServiceType/sectordetails.dart';
import 'package:navigationdrawer/fragments/CommonService/ErrorMessage.dart';
import 'package:navigationdrawer/fragments/CommonService/Loading.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';

class CitizenServiceList extends StatefulWidget {
  final String id;
  final String mainServID;
  final String serviceArea;

  CitizenServiceList(this.id, this.mainServID, this.serviceArea, {Key key})
      : super(key: key);
  @override
  _CitizenServiceListState createState() => _CitizenServiceListState();
}

@override
State<StatefulWidget> createState() {
  return null;
}

class _CitizenServiceListState extends State<CitizenServiceList> {
  CitizenServiceList_MainBloc _bloc;
  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();

    _bloc = CitizenServiceList_MainBloc(
        widget.id, widget.mainServID, widget.serviceArea);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _apptitle(widget.id),
      body: RefreshIndicator(
          onRefresh: () => _bloc.fetchServiceList(
              widget.id, widget.mainServID, widget.serviceArea),
          child: StreamBuilder<ApiResponse<BaseServiceModel>>(
              stream: _bloc.citizenServiceListStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data.status) {
                    case ApiStatus.Loading:
                      return Loading(loadingMessage: snapshot.data.message);
                      break;
                    case ApiStatus.Completed:
                      return CitizenserverList(
                        availablelist: snapshot.data.data,
                        id: widget.id,
                      );
                      break;
                    case ApiStatus.Error:
                      return ErrorMessage(
                        errorMessage: snapshot.data.message,
                        onRetryPressed: () => _bloc.fetchServiceList(
                            widget.id, widget.mainServID, widget.serviceArea),
                      );
                      break;
                  }
                }
                return Container();
              })),
    );
  }

  _apptitle(String obj) {
    if (widget.id == '%27SER_UBMNT%27') {
      return AppBar(title: Text("Citizen Service-Urban"));
    } else {
      return AppBar(title: Text("Citizen Service-Rural"));
    }
  }
}

class CitizenserverList extends StatefulWidget {
  BaseServiceModel availablelist;

  String id;

  CitizenserverList({Key key, this.availablelist, this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CitizenserverListState();
  }
}

class CitizenserverListState extends State<CitizenserverList> {
  bool isButtonPressed = false;
  bool viewVisible = true;
  String mainServID;
  String serviceArea;
  String subgroupId;
  String activityId;
  String value;

  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    PreferenceUtils.init();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.id == "Rural") {
      viewVisible = false;
    } else {
      viewVisible = true;
    }
    return new Scaffold(
        backgroundColor: Colors.white,
        body: new Column(children: <Widget>[
          new Container(
              padding: EdgeInsetsDirectional.only(start: 0, end: 0, top: 20.0),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[])),
          Container(
            child: new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.green,
                elevation: 10,
                child: new ListTile(
                  leading: new Icon(
                    Icons.search,
                    color: Colors.white70,
                  ),
                  title: new TextField(
                    cursorColor: Colors.white70,
                    style: TextStyle(color: Colors.white),
                    controller: controller,
                    decoration: new InputDecoration(
                        hintStyle: TextStyle(color: Colors.white70),
                        hintText: 'Search',
                        border: InputBorder.none),
                    onChanged: onSearchTextChanged,
                  ),
                  trailing: new IconButton(
                    icon: new Icon(
                      Icons.cancel,
                      color: Colors.white70,
                    ),
                    onPressed: () {
                      _userDetails.clear();
                      _searchResult.clear();
                      controller.clear();
                      onSearchTextChanged('');
                    },
                  ),
                ),
              ),
            ),
          ),
          Container(
              child: new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Service List",
                      style: TextStyle(
                          color: Colors.black87,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)))),
          new Expanded(
            child: _searchResult.length != 0 || controller.text.isNotEmpty
                ? new ListView.builder(
                    itemCount: _searchResult.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () => _finalSearch(_searchResult[i].toString()),
                        child: Card(
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white),
                            child: new ListTile(
                                trailing: Icon(Icons.navigate_next,
                                    color: Colors.white70, size: 30.0),
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
                          .availablelist.d.results[index].activityDesc
                          .toString();
                      String result = activityDesc[0].toUpperCase() +
                          activityDesc.substring(1).toLowerCase();
                      if (result != null) {
                        _userDetails.add(result.toString());
                      }
                      return GestureDetector(
                        onTap: () => _finalSearch(result),
                        child: Card(
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white),
                            child: new ListTile(
                                trailing: Icon(Icons.navigate_next,
                                    color: Colors.black87, size: 20.0),
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
    print("searchtext " + text);
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
      print("After search " + _userDetails.length.toString());
      for (int i = 0; i < _userDetails.length; i++) {
        value = _userDetails[i].split(",").toString();
        if (value.toLowerCase().contains(text.toLowerCase())) {
          print("finalresult " + value.toString());
          String changed = value.replaceAll("[", "").replaceAll("]", "");
          _searchResult.add(changed);
        }
      }
    });
  }

  List<String> _searchResult = [];
  List<String> _userDetails = [];

  _finalSearch(String searchResult) {
    String searchResultV = searchResult.replaceAll("[", "").replaceAll("]", "");
    if (searchResultV != null) {
      for (int i = 0; i < widget.availablelist.d.results.length; i++) {
        print(widget.availablelist.d.results[i].activityDesc.toString());
        if (searchResultV.toUpperCase().toString() ==
            widget.availablelist.d.results[i].activityDesc
                .toString()
                .toUpperCase()) {
          String activityId =
              widget.availablelist.d.results[i].activityID.toString();
          print("serviceList search " + activityId);
          print("searchitem:" +
              widget.availablelist.d.results[i].activityDesc.toString());
          PreferenceUtils.setString("ServiceList", searchResult);
          mainServID = PreferenceUtils.getString(Preferences.mainServID);
          serviceArea = PreferenceUtils.getString(Preferences.citizenService);
          subgroupId = PreferenceUtils.getString(Preferences.subgroupId);
          PreferenceUtils.setString("activityId", activityId);
          print("mainserviceId" +
              mainServID +
              "serviceArea" +
              serviceArea +
              "subgroupId" +
              subgroupId +
              "activityId" +
              activityId);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Sectordetails(
                  mainServID, serviceArea, subgroupId, activityId)));
        }
      }
    }
  }
}
