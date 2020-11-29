import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navigationdrawer/Network/ApiResponse.dart';

import 'package:navigationdrawer/fragments/BaseService/BaseServiceModel.dart';
import 'package:navigationdrawer/fragments/CitizenService/CitizenServiceType/CitizenServiceTypeModel.dart';
import 'package:navigationdrawer/fragments/CitizenService/CitizenServiceType/CitizenServiceType_MainBloc.dart';
import 'package:navigationdrawer/fragments/CommonService/ErrorMessage.dart';
import 'package:navigationdrawer/fragments/CommonService/Loading.dart';
import 'package:navigationdrawer/fragments/smogandpollution/SmogandpollLanding.dart';

// ignore: must_be_immutable
class SmogPollutionfragment extends StatefulWidget {
  
  BaseServiceModel availablelist;
  SmogPollutionfragment({Key key, this.availablelist}) : super(key: key);
  @override
  _SmogPollutionfragmentState createState() => _SmogPollutionfragmentState();
}

@override
State<StatefulWidget> createState() {
  return null;
}

class _SmogPollutionfragmentState extends State<SmogPollutionfragment> {
    CitizenServiceType_MainBloc _bloc;

  var smokandpollution;
  @override
  void initState() {
    super.initState();
    var smokandpollution =
        widget.availablelist.d.results[1].mainServID.toString();
    print(smokandpollution);
   _bloc = CitizenServiceType_MainBloc(smokandpollution);
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
      appBar:null,
      body: RefreshIndicator(
          onRefresh: () => _bloc.fetchTypeService(smokandpollution),
          child: StreamBuilder<ApiResponse<CitizenServiceTypeModel>>(
              stream: _bloc.citizenTypeserviceStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data.status) {
                    case ApiStatus.Loading:
                      return Loading(loadingMessage: snapshot.data.message);
                      break;
                    case ApiStatus.Completed:
                      return SmogandpollLanding(
                        availablelist: snapshot.data.data,
                        id:smokandpollution,
                      );
                      break;
                    case ApiStatus.Error:
                      return ErrorMessage(
                        errorMessage: snapshot.data.message,
                        onRetryPressed: () => _bloc.fetchTypeService(smokandpollution),
                      );
                      break;
                  }
                }
                return Container();
              })),
    );
  
  }


}
