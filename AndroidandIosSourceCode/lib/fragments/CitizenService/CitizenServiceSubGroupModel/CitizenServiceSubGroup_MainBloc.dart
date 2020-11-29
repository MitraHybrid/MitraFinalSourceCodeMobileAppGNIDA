import 'dart:async';
import 'package:navigationdrawer/Network/ApiResponse.dart';
import 'package:navigationdrawer/fragments/BaseService/BaseServiceModel.dart';
import 'package:navigationdrawer/fragments/CitizenService/CitizenServiceSubGroupModel/CitizenServiceSubGroupRepo.dart';

class CitizenServiceSubGroupMainBloc {
  CitizenServiceSubGroupRepo _citizenserviceSubGroupRepo;
  StreamController _citizenServiceSubGroupController;

  StreamSink<ApiResponse<BaseServiceModel>> get citizenserviceSubGroupSink =>
      _citizenServiceSubGroupController.sink;

  Stream<ApiResponse<BaseServiceModel>> get citizenserviceSubGroupStream =>
      _citizenServiceSubGroupController.stream;

  CitizenServiceSubGroupMainBloc(String category) {
    _citizenServiceSubGroupController =
        StreamController<ApiResponse<BaseServiceModel>>();
    _citizenserviceSubGroupRepo = CitizenServiceSubGroupRepo();
    fetchSubGroup(category);
  }

  fetchSubGroup(category) async {
    citizenserviceSubGroupSink.add(ApiResponse.loading('please wait'));
    try {
      BaseServiceModel citizenSubGroupedata =
          await _citizenserviceSubGroupRepo.fetchSuBgroupserviceData(category);
      citizenserviceSubGroupSink.add(ApiResponse.completed(citizenSubGroupedata));
    } catch (e) {
      citizenserviceSubGroupSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _citizenServiceSubGroupController?.close();
  }
}
