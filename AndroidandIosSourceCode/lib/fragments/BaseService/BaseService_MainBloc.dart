import 'dart:async';
import 'package:navigationdrawer/Network/ApiResponse.dart';
import 'package:navigationdrawer/fragments/BaseService/BaseServiceMainBlocRepository.dart';
import 'package:navigationdrawer/fragments/BaseService/BaseServiceModel.dart';

class BaseServiceMainBloc {
  
  BaseServiceMainBlocRepository _baseServiceRepository;
  StreamController _baseServiceController;

  StreamSink<ApiResponse<BaseServiceModel>> get baseserviceSink =>
      _baseServiceController.sink;

  Stream<ApiResponse<BaseServiceModel>> get baseserviceStream =>
      _baseServiceController.stream;

  BaseServiceMainBloc() {
    _baseServiceController =
        StreamController<ApiResponse<BaseServiceModel>>();
   _baseServiceRepository = BaseServiceMainBlocRepository();
  baseService();
  }

  baseService() async {
    baseserviceSink.add(ApiResponse.loading('please wait'));
    try {
      BaseServiceModel baseServicedata =
          await _baseServiceRepository.fetchBaseServiceData();
      baseserviceSink.add(ApiResponse.completed(baseServicedata));
    } catch (e) {
      baseserviceSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }


  dispose() {
    _baseServiceController?.close();
  }

  

 
}
