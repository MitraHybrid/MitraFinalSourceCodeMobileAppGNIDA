import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navigationdrawer/Network/ApiResponse.dart';
import 'package:navigationdrawer/Utility/AppButton.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';
import 'package:navigationdrawer/Utility/shared_preferences_util.dart';
import 'package:navigationdrawer/fragments/BaseService/BaseServiceModel.dart';
import 'package:navigationdrawer/fragments/BaseService/BaseService_MainBloc.dart';
import 'package:navigationdrawer/fragments/CitizenService/CitizenServiceType/CitizenServicetype.dart';
import 'package:navigationdrawer/fragments/CommonService/ErrorMessage.dart';
import 'package:navigationdrawer/fragments/CommonService/Loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingFragment extends StatefulWidget {
  LandingFragment({Key key}) : super(key: key);
  @override
  _LandingFragmentState createState() => _LandingFragmentState();
}

class _LandingFragmentState extends State<LandingFragment> {
  BaseServiceMainBloc _bloc;
  var connectivityResult;

  @override
  void initState() {
    _bloc = BaseServiceMainBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: null,
      body: RefreshIndicator(
          onRefresh: () => _bloc.baseService(),
          child: StreamBuilder<ApiResponse<BaseServiceModel>>(
              stream: _bloc.baseserviceStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data.status) {
                    case ApiStatus.Loading:
                      return Loading(loadingMessage: snapshot.data.message);
                      break;
                    case ApiStatus.Completed:
                      return SubGroup(availablelist: snapshot.data.data);
                      break;
                    case ApiStatus.Error:
                      return ErrorMessage(
                        errorMessage: snapshot.data.message,
                        onRetryPressed: () => _bloc.baseService(),
                      );
                      break;
                    default:
                      break;
                  }
                }
                return Container();
              })),
    );
  }
}

class SubGroup extends StatefulWidget {
  BaseServiceModel availablelist;
  SharedPreferences sharedPreferences;
  SubGroup({
    Key key,
    this.availablelist,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SubGroupState();
  }
}

class SubGroupState extends State<SubGroup> {
  @override
  void initState() {
    var citizenService =
        widget.availablelist.d.results[0].mainServID.toString();
    print(citizenService);

    super.initState();
    PreferenceUtils.init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: _onBackPressed,
                child: Scaffold(
                    body: new SingleChildScrollView(
                        child: Center(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            HOME.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(16.0),
                            child: Image.asset('assets/images/mitracomp.jpg'),
                          ),
                          AppButton(
                              id: "citizenservice",
                              width: size.width * 0.7,
                              height: size.height * 0.08,
                              onPressed: (route, count, id) =>
                                  this._clicked(route, context, id),
                              route: '/citizenservice',
                              title: HOME.citizenService),
                          Text(
                            HOME.loginMessage,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decorationStyle: TextDecorationStyle.wavy,
                              fontSize: 18.0,
                            ),
                          ),
                          AppButton(
                            id: 'allotee',
                            width: size.width * 0.7,
                            height: size.height * 0.08,
                            onPressed: (route, count, id) =>
                                this._clicked(route, context, id),
                            route: '/allotte',
                            title: HOME.allotee,
                          ),
                          AppButton(
                            id: 'authorityUser',
                            width: size.width * 0.7,
                            height: size.height * 0.08,
                            onPressed: (route, count, id) =>
                                this._clicked(route, context, id),
                            route: '/login',
                            title: HOME.authorityUser,
                          )
                        ],
                      ),
                    ),
                  ),
                ))));
          }
        
          _clicked(route, context, id) async {
            _serviceCall(id);
            Navigator.pushNamed(context, route, arguments: id);
          }
        
          _serviceCall(id) {
            if (id == 'citizenservice') {
              if (widget.availablelist != null) {
                var serId = widget.availablelist.d.results[0].mainServID.toString();
                if (serId != null && serId == "CITZ_SRV") {
                  PreferenceUtils.setString(Preferences.mainServID, serId);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CitizenServicetype(serId)));
                }
              }
            }
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
          onTap: () => Navigator.of(context).pop(true),
          child: Text("YES"),
        ),
      ],
    ),
  ) ??
      false;
}
}
