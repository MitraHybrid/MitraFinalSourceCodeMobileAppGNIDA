import 'dart:async';
import 'package:navigationdrawer/Network/ApiResponse.dart';
import 'package:navigationdrawer/fragments/CitizenService/citizenServiceModel/CitizenserviceMainBlocRepository.dart';
import 'package:navigationdrawer/fragments/CitizenService/citizenServiceModel/CitizenserviceModel.dart';

class Citizenservice_MaintBloc {
  
  CitizenserviceMainBlocRepository _citizenserviceRepository;
  StreamController _citizenServiceController;

  StreamSink<ApiResponse<CitizenserviceModel>> get citizenserviceSink =>
      _citizenServiceController.sink;

  Stream<ApiResponse<CitizenserviceModel>> get citizenserviceStream =>
      _citizenServiceController.stream;

  Citizenservice_MaintBloc(String category) {
    _citizenServiceController =
        StreamController<ApiResponse<CitizenserviceModel>>();
    _citizenserviceRepository = CitizenserviceMainBlocRepository();
    fetchNotes(category);
  }

  fetchNotes(category) async {
    citizenserviceSink.add(ApiResponse.loading('please wait'));
    try {
      CitizenserviceModel citizenservicedata =
          await _citizenserviceRepository.fetchcitizenserviceData(category);
      citizenserviceSink.add(ApiResponse.completed(citizenservicedata));
    } catch (e) {
      citizenserviceSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }


  dispose() {
    _citizenServiceController?.close();
  }

  

 
}
