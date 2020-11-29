import 'dart:async';
import 'package:navigationdrawer/Network/ApiResponse.dart';
import 'package:navigationdrawer/fragments/CitizenService/CitizenServiceType/CitizenServiceTypeMainBlocRep.dart';
import 'package:navigationdrawer/fragments/CitizenService/CitizenServiceType/CitizenServiceTypeModel.dart';

class CitizenServiceType_MainBloc {
  
  CitizenServiceTypeMainBlocRep _citizenserviceRepository;
  StreamController _citizenServiceTypeController;

  StreamSink<ApiResponse<CitizenServiceTypeModel>> get citizenTypeserviceSink =>
      _citizenServiceTypeController.sink;

  Stream<ApiResponse<CitizenServiceTypeModel>> get citizenTypeserviceStream =>
      _citizenServiceTypeController.stream;

 CitizenServiceType_MainBloc(String category) {
    _citizenServiceTypeController =
        StreamController<ApiResponse<CitizenServiceTypeModel>>();
    _citizenserviceRepository = CitizenServiceTypeMainBlocRep();
    fetchTypeService(category);
  }

  fetchTypeService(category) async {
    citizenTypeserviceSink.add(ApiResponse.loading('please wait'));
    try {
      CitizenServiceTypeModel citizenTypeservicedata;
      citizenTypeservicedata =
          await _citizenserviceRepository.fetchcitizenserviceTypeData(category);
      citizenTypeserviceSink.add(ApiResponse.completed(citizenTypeservicedata));
    } catch (e) {
      citizenTypeserviceSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }


  dispose() {
    _citizenServiceTypeController?.close();
  }

  

 
}
