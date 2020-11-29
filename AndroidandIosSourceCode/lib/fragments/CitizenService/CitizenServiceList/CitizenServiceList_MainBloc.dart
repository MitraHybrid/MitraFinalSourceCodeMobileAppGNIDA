import 'dart:async';

import 'package:navigationdrawer/Network/ApiResponse.dart';
import 'package:navigationdrawer/fragments/BaseService/BaseServiceModel.dart';
import 'package:navigationdrawer/fragments/CitizenService/CitizenServiceList/CitizenServiceListRepo.dart';

// ignore: camel_case_types
class CitizenServiceList_MainBloc {
  
  CitizenServiceListRepo _citizenserviceListRepository;
  StreamController _citizenServiceController;

  StreamSink<ApiResponse<BaseServiceModel>> get citizenServiceListSink =>
      _citizenServiceController.sink;

  Stream<ApiResponse<BaseServiceModel>> get citizenServiceListStream =>
      _citizenServiceController.stream;

  CitizenServiceList_MainBloc(String category, String citizenType, String serviceArea) {
    _citizenServiceController =
        StreamController<ApiResponse<BaseServiceModel>>();
    _citizenserviceListRepository = CitizenServiceListRepo();
     fetchServiceList(category,citizenType,serviceArea);
  }

  fetchServiceList(category,citizenType,serviceArea) async {
    citizenServiceListSink.add(ApiResponse.loading('please wait'));
    try {
      BaseServiceModel citizenservicedata =
          await _citizenserviceListRepository.fetchcitizenserviceListData(category,citizenType,serviceArea);
      citizenServiceListSink.add(ApiResponse.completed(citizenservicedata));
    } catch (e) {
      citizenServiceListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }


  dispose() {
    _citizenServiceController?.close();
  }

  

 
}
