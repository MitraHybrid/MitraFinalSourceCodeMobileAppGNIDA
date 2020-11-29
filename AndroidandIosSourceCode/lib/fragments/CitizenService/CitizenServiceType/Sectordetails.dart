import 'package:flutter/material.dart';
import 'package:navigationdrawer/Network/ApiResponse.dart';
import 'package:navigationdrawer/Utility/shared_preferences_util.dart';
import 'package:navigationdrawer/fragments/BaseService/BaseServiceModel.dart';
import 'package:navigationdrawer/fragments/CitizenComplaint/Citizendetails.dart';
import 'package:navigationdrawer/fragments/CitizenService/CitizenSectorArea/CitizensectorList_MainBloc.dart';
import 'package:navigationdrawer/fragments/CommonService/ErrorMessage.dart';
import 'package:navigationdrawer/fragments/CommonService/Loading.dart';

class Sectordetails extends StatefulWidget {
  final String subgroupId;
  final String mainServID;
  final String serviceArea;
  final String activityId;
  Sectordetails(
      this.mainServID, this.serviceArea, this.subgroupId, this.activityId,
      {Key key})
      : super(key: key);
  @override
  _SectordetailsState createState() => _SectordetailsState();
}

@override
State<StatefulWidget> createState() {
  return null;
}

class _SectordetailsState extends State<Sectordetails> {
  CitizensectorList_MainBloc _bloc;
  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = CitizensectorList_MainBloc(widget.mainServID, widget.serviceArea,
        widget.subgroupId, widget.activityId);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: RefreshIndicator(
          onRefresh: () => _bloc.fetchSectorList(widget.mainServID,
              widget.serviceArea, widget.subgroupId, widget.activityId),
          child: StreamBuilder<ApiResponse<BaseServiceModel>>(
              stream: _bloc.citizenSectorListStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data.status) {
                    case ApiStatus.Loading:
                      return Loading(loadingMessage: snapshot.data.message);
                      break;
                    case ApiStatus.Completed:
                      return SectorListDetails(
                        availableSector: snapshot.data.data,
                      );
                      break;
                    case ApiStatus.Error:
                      return ErrorMessage(
                        errorMessage: snapshot.data.message,
                        onRetryPressed: () => _bloc.fetchSectorList(
                            widget.mainServID,
                            widget.serviceArea,
                            widget.subgroupId,
                            widget.activityId),
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
class SectorListDetails extends StatefulWidget {
  BaseServiceModel availableSector;
  SectorListDetails({
    Key key,
    this.availableSector,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SectorListDetailsState();
  }
}

class SectorListDetailsState extends State<SectorListDetails> {
  bool isButtonPressed = false;
  bool viewVisible = true;
  String mainServID;
  String serviceArea;
  String sectorId;

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
        appBar: new AppBar(
        title: new Text('Sector Area'),
      ),
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
                  child: Text("Avilable SectorList",
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
                        onTap: () => _selectedItem(_searchResult[i].toString()),
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
                    itemCount: widget.availableSector.d.results.length,
                    itemBuilder: (context, index) {
                      String activityDesc = widget
                          .availableSector.d.results[index].sectorDesc
                          .toString();
                      String result = activityDesc[0].toUpperCase() +
                          activityDesc.substring(1).toLowerCase();
                      if (result != null) {
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
        if (_userDetails[i].toUpperCase().contains(text.toUpperCase())) {
          print(_userDetails[i].toString());
          _searchResult.add(_userDetails[i].toString());
        }
      }
    });
  }

  List<String> _searchResult = [];
  List<String> _userDetails = [];
  _selectedItem(String sectordescVaue) {
     PreferenceUtils.setString("Sectordesc", sectordescVaue);
      print("sectorValue"+ sectordescVaue);
      if (sectordescVaue != null) {
      for (int i = 0; i < widget.availableSector.d.results.length; i++) {
        print(widget.availableSector.d.results[i].sectorID.toString());
        if (sectordescVaue.toUpperCase().toString() ==
            widget.availableSector.d.results[i].sectorDesc
                .toString()
                .toUpperCase()) {
                   sectorId =widget.availableSector.d.results[i].sectorID;
                              }
  
      }
    PreferenceUtils.setString("SectorId", sectorId);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            CitizenSectorDetails(sectorId)));
    print(sectorId);
              }
       }
  }