


import 'package:navigationdrawer/Network/ApiBase.dart';
import 'package:navigationdrawer/fragments/CitizenService/citizenServiceModel/CitizenserviceModel.dart';

class SmogPollutionserviceMainBlocRepository{

ApiBase _provider = ApiBase ();

 Future<CitizenserviceModel> fetchSmogPollutionserviceData(category) async {
    final response = await _provider.get(category);
    return CitizenserviceModel.fromJson(response);
  }

  
  
}