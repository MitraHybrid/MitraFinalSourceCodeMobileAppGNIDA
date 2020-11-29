import 'package:flutter/material.dart';
import 'package:navigationdrawer/Utility/AppButton.dart';

class CitizenList extends StatefulWidget {
 
  CitizenList( {Key key}) : super(key: key);

  @override
  CitizenListState createState() => CitizenListState();
}


class CitizenListState extends State<CitizenList> {
  @override
  void initState() {
   // _bloc = CitizenServiceType_MainBloc(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                 child: CardWidget(),
              
              ),
              Expanded(
                 child: CustomAppBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //   RefreshIndicator(
  //       onRefresh: () => _bloc.fetchTypeService(widget.id),
  //       child: StreamBuilder<ApiResponse<CitizenServiceTypeModel>>(
  //           stream: _bloc.citizenTypeserviceStream,
  //           builder: (context, snapshot) {
  //             if (snapshot.hasData) {
  //               switch (snapshot.data.status) {
  //                 case ApiStatus.Loading:
  //                   return Loading(loadingMessage: snapshot.data.message);
  //                   break;
  //                 case ApiStatus.Completed:
  //                   return null;
  //                   // return CitizenserverMaingroup(
  //                   //   availablelist: snapshot.data.data,
  //                   //   id: widget.id,
  //                   // );
  //                   break;
  //                 case ApiStatus.Error:
  //                   return ErrorMessage(
  //                     errorMessage: snapshot.data.message,
  //                     onRetryPressed: () => _bloc.fetchTypeService(widget.id),
  //                   );
  //                   break;
  //               }
  //             }
  //             return Container();
  //           })),
  // );
}

class CardWidget extends StatefulWidget{
  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
           Row(children: <Widget>[
                    Expanded(
                      child: AppButton(
                        title: "Citizenservice Urban",
                        onPressed: () => null,
                      ),
                    ),
                    Expanded(
                      child: AppButton(
                      title: "Citizenservice Urban",
                        onPressed: () => null,
                      ),
                    ),
                   
                  ])
      ],
    );
  }

}

class CustomAppBar extends StatelessWidget  {
   @override
  Widget build(BuildContext context) {
    return Container(
     child: Text("data"),
    );
  }

}


