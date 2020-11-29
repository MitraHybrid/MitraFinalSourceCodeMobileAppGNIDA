// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:navigationdrawer/Network/ApiResponse.dart';
// import 'package:navigationdrawer/fragments/CitizenService/CitizenServiceSubGroupModel/CitizenServiceSubGroup_MainBloc.dart';
// import 'package:navigationdrawer/fragments/CitizenService/CitizenServiceType/CitizenServiceTypeModel.dart';
// import 'package:navigationdrawer/fragments/CitizenService/CitizenServiceType/CitizenServiceType_MainBloc.dart';
// import 'package:navigationdrawer/fragments/CommonService/ErrorMessage.dart';
// import 'package:navigationdrawer/fragments/CommonService/Loading.dart';

// // ignore: must_be_immutable
// class CitizenComplaint extends StatefulWidget {
//   String id;
//   String serviceArea;
//   String subgroupId;
//   String activityDesc;

//   CitizenComplaint(
//       this.id, this.serviceArea, this.subgroupId, this.activityDesc,
//       {Key key})
//       : super(key: key);

//   @override
//   _CitizenComplaintState createState() => _CitizenComplaintState();
// }

// @override
// State<StatefulWidget> createState() {
//   return null;
// }

// class _CitizenComplaintState extends State<CitizenComplaint> {
//   CitizenServiceType_MainBloc _bloc;

//   TextEditingController controller = new TextEditingController();
//   Future<ApiResponse> list;

//   @override
//   void initState() {
//     _bloc = CitizenServiceType_MainBloc(widget.id);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: _apptitle(),
//       body: RefreshIndicator(
//           onRefresh: () => _bloc.fetchTypeService(widget.id),
//           child: StreamBuilder<ApiResponse<CitizenServiceTypeModel>>(
//               stream: _bloc.citizenTypeserviceStream,
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   switch (snapshot.data.status) {
//                     case ApiStatus.Loading:
//                       return Loading(loadingMessage: snapshot.data.message);
//                       break;
//                     case ApiStatus.Completed:
//                       return CitizensectorList(
//                         availablelist: snapshot.data.data,
//                         id: widget.id,
//                       );
//                       break;
//                     case ApiStatus.Error:
//                       return ErrorMessage(
//                         errorMessage: snapshot.data.message,
//                         onRetryPressed: () => _bloc.fetchTypeService(widget.id),
//                       );
//                       break;
//                   }
//                 }
//                 return Container();
//               })),
//     );
//   }

//   _apptitle() {
//     return AppBar(title: Text("Citizen Service"));
//   }
// }

// class CitizensectorList extends StatefulWidget {
//   CitizenServiceTypeModel availablelist;

//   String id;

//   CitizensectorList({Key key, this.availablelist, this.id})
//       : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     return CitizensectorListState();
//   }
// }

// class CitizensectorListState extends State<CitizensectorList> {
//   bool isButtonPressed = false;
//   bool viewVisible = true;
//   String citizenType;
//   String serviceArea;
//   CitizenServiceSubGroupMainBloc _subgroupbloc;
//   TextEditingController controller = new TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _subgroupbloc = CitizenServiceSubGroupMainBloc(null);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: null,
//       body: RefreshIndicator(
//           onRefresh: () => _bloc.fetchTypeService(widget.id),
//           child: StreamBuilder<ApiResponse<CitizenServiceTypeModel>>(
//               stream: _bloc.citizenTypeserviceStream,
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   switch (snapshot.data.status) {
//                     case ApiStatus.Loading:
//                       return Loading(loadingMessage: snapshot.data.message);
//                       break;
//                     case ApiStatus.Completed:
//                       return CitizensectorList(
//                         availablelist: snapshot.data.data,
//                         id: widget.id,
//                       );
//                       break;
//                     case ApiStatus.Error:
//                       return ErrorMessage(
//                         errorMessage: snapshot.data.message,
//                         onRetryPressed: () => _bloc.fetchTypeService(widget.id),
//                       );
//                       break;
//                   }
//                 }
//                 return Container();
//               })),
//     );
//   }
// }
