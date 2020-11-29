
import 'package:navigationdrawer/Network/ApiBase.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';
import 'package:navigationdrawer/fragments/CitizenService/CitizenServiceType/CitizenServiceTypeModel.dart';

class CitizenServiceTypeMainBlocRep{

ApiBase _provider = ApiBase ();

 Future<CitizenServiceTypeModel> fetchcitizenserviceTypeData(category) async {
    final response = await _provider.get( Path + "%27"+ category+"%27");
    return CitizenServiceTypeModel.fromJson(response);
  }

  
  
}
 