
import 'package:navigationdrawer/Network/ApiBase.dart';
import 'package:navigationdrawer/fragments/CitizenService/citizenServiceModel/CitizenserviceModel.dart';

class CitizenserviceMainBlocRepository{

ApiBase _provider = ApiBase ();

 Future<CitizenserviceModel> fetchcitizenserviceData(category) async {
    final response = await _provider.get(category);
    return CitizenserviceModel.fromJson(response);
  }

  
  
}
 