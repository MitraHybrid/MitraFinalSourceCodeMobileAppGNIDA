import 'dart:async';

import 'package:navigationdrawer/Network/ApiResponse.dart';
import 'package:navigationdrawer/fragments/CitizenService/ConcernPerson/CitizenServiceConPersonRepo.dart';
import 'package:navigationdrawer/fragments/CitizenService/ConcernPerson/ConcernPersonModel.dart';

// ignore: camel_case_types
class CitizenServiceConcPerson_MainBloc {
  
  CitizenServiceConPersonRepo _citizenserviceConPersonRepo;
  StreamController _citizenServiceController;

  StreamSink<ApiResponse<ConcernPersonModel>> get citizenConcerPersonSink =>
      _citizenServiceController.sink;

  Stream<ApiResponse<ConcernPersonModel>> get citizenConcerPersonStream =>
      _citizenServiceController.stream;

  CitizenServiceConcPerson_MainBloc(String category) {
    _citizenServiceController =
        StreamController<ApiResponse<ConcernPersonModel>>();
    _citizenserviceConPersonRepo = CitizenServiceConPersonRepo();
     fetchConcerpersonDetails(category);
  }

  fetchConcerpersonDetails(category) async {
    citizenConcerPersonSink.add(ApiResponse.loading('please wait'));
    try {
      ConcernPersonModel citizenservicedata =
          await _citizenserviceConPersonRepo.fetchConcerpersonPost(category);
      citizenConcerPersonSink.add(ApiResponse.completed(citizenservicedata));
    } catch (e) {
      citizenConcerPersonSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }


  dispose() {
    _citizenServiceController?.close();
  }

  

 
}
