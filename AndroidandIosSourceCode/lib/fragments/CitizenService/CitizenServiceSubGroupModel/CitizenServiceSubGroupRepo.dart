
import 'package:navigationdrawer/Network/ApiBase.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';
import 'package:navigationdrawer/fragments/BaseService/BaseServiceModel.dart';

class CitizenServiceSubGroupRepo{

ApiBase _provider = ApiBase ();

 Future<BaseServiceModel> fetchSuBgroupserviceData(category) async {
    final response = await _provider.get(BaseGroupUrl + "%27"+ category+"%27");
    return BaseServiceModel.fromJson(response);
  }

  
  
}
 