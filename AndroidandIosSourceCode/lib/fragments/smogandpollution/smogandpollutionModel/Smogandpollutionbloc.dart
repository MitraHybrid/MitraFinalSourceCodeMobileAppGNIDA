import 'dart:async';

import 'package:navigationdrawer/Network/ApiResponse.dart';
import 'package:navigationdrawer/fragments/CitizenService/citizenServiceModel/CitizenserviceModel.dart';
import 'package:navigationdrawer/fragments/smogandpollution/smogandpollutionModel/smogPollutionserviceMainBlocRepository.dart';

class Smogandpollutionbloc {
  
  SmogPollutionserviceMainBlocRepository _smogPollutionserviceRepository;
  StreamController _smogpollutionServiceController;
    


  StreamSink<ApiResponse<CitizenserviceModel>> get smogPollutionserviceSink =>
      _smogpollutionServiceController.sink;

  Stream<ApiResponse<CitizenserviceModel>> get smogPollutionserviceStream =>
      _smogpollutionServiceController.stream;

  

  Smogandpollutionbloc(String category) {
    _smogpollutionServiceController =
        StreamController<ApiResponse<CitizenserviceModel>>();
    _smogPollutionserviceRepository = SmogPollutionserviceMainBlocRepository();
     smogandpollution(category);
    
  }

 

  smogandpollution(category) async{
      smogPollutionserviceSink.add(ApiResponse.loading('please wait'));
    try {
      CitizenserviceModel citizenservicedata =
          await _smogPollutionserviceRepository.fetchSmogPollutionserviceData(category);
      smogPollutionserviceSink.add(ApiResponse.completed(citizenservicedata));
    } catch (e) {
      smogPollutionserviceSink.add(ApiResponse.error(e.toString()));
      print(e);
    }

  }

  dispose() {
    _smogpollutionServiceController?.close();
  }
}
