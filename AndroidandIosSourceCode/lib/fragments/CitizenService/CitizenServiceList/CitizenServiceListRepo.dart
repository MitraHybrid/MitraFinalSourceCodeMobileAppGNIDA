
import 'package:navigationdrawer/Network/ApiBase.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';
import 'package:navigationdrawer/fragments/BaseService/BaseServiceModel.dart';

class CitizenServiceListRepo{

ApiBase _provider = ApiBase ();

 Future<BaseServiceModel> fetchcitizenserviceListData(category,citizenType,serviceArea) async {
    final response = await _provider.get(ServiceSet+Client+Filter+ "%27"+ citizenType+"%27" +ServiceArea+ "%27"+ serviceArea+"%27"+ SubGroupId+ "%27"+ category+"%27") ;
    return BaseServiceModel.fromJson(response);
  }

  
  
}
 