import 'dart:async';

import 'package:navigationdrawer/Network/ApiResponse.dart';
import 'package:navigationdrawer/fragments/BaseService/BaseServiceModel.dart';
import 'package:navigationdrawer/fragments/CitizenService/CitizenSectorArea/CitiztenSectorListRepo.dart';

// ignore: camel_case_types
class CitizensectorList_MainBloc {
  
  CitiztenSectorListRepo _citizenSectorListRepository;
  StreamController _citizenServiceController;

  StreamSink<ApiResponse<BaseServiceModel>> get citizenSectorListSink =>
      _citizenServiceController.sink;

  Stream<ApiResponse<BaseServiceModel>> get citizenSectorListStream =>
      _citizenServiceController.stream;

  CitizensectorList_MainBloc(String citizenType, String serviceArea,String subgroupId,  String activityId) {
    _citizenServiceController =
        StreamController<ApiResponse<BaseServiceModel>>();
    _citizenSectorListRepository = CitiztenSectorListRepo();
     fetchSectorList(citizenType,serviceArea,subgroupId,activityId);
  }

  fetchSectorList(citizenType,serviceArea, subgroupId,activityId) async {
    citizenSectorListSink.add(ApiResponse.loading('please wait'));
    try {
      BaseServiceModel citizenservicedata =
          await _citizenSectorListRepository.fetchcitizensectorListData(citizenType,serviceArea,subgroupId,activityId);
      citizenSectorListSink.add(ApiResponse.completed(citizenservicedata));
    } catch (e) {
      citizenSectorListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _citizenServiceController?.close();
  }
 
}
