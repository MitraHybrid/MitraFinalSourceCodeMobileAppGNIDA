import 'package:flutter/material.dart';
import 'package:navigationdrawer/Network/ApiResponse.dart';
import 'package:navigationdrawer/fragments/BaseService/BaseServiceModel.dart';
import 'package:navigationdrawer/fragments/BaseService/BaseService_MainBloc.dart';
import 'package:navigationdrawer/fragments/CommonService/ErrorMessage.dart';
import 'package:navigationdrawer/fragments/CommonService/Loading.dart';
import 'package:navigationdrawer/fragments/smogandpollution/SmogPollutionfragment.dart';

class Smollandpollutiondetail extends StatefulWidget {
 
  const Smollandpollutiondetail( {Key key}) : super(key: key);
  @override
  _SmollandpollutiondetailState createState() =>
      new _SmollandpollutiondetailState();
}

class _SmollandpollutiondetailState extends State<Smollandpollutiondetail> {
  BaseServiceMainBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BaseServiceMainBloc();
  }

  @override
  Widget build(BuildContext context) {
   // String obj = ModalRoute.of(context).settings.arguments;
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
                      return SmogPollutionfragment(availablelist: snapshot.data.data);
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



// ignore: must_be_immutable
class CitizenserverList extends StatefulWidget {

  BaseServiceModel availablelist;
  CitizenserverList({Key key, this.availablelist}) : super(key: key);

  @override
  _CitizenserverListState createState() => _CitizenserverListState();
}



class _CitizenserverListState extends State<CitizenserverList> {


  @override
  void initState() {
    super.initState();
  
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
    return new Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: widget.availablelist.d.results.length,
        itemBuilder: (context, index) {
          String activityDesc =
              widget.availablelist.d.results[index].subgroupDec;
          print(activityDesc);
          return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.0,
                vertical: 1.0,
              ),
              child: InkWell(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => Citizendetails()));
                  },
                  child: SizedBox(
                    height: 55,
                    child: Container(
                      color: Colors.black45,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: Text(
                          activityDesc.toString(),
                          //  categoryList.categories[index],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto'),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  )));
        },
        //   itemCount: availablelist.d.results.length,
        // shrinkWrap: true,
        //  physics: ClampingScrollPhysics(),
      ),
    );
  }
}

