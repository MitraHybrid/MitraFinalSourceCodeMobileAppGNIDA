
import 'package:navigationdrawer/Network/ApiBase.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';
import 'package:navigationdrawer/fragments/BaseService/BaseServiceModel.dart';

class CitiztenSectorListRepo{

ApiBase _provider = ApiBase ();

 Future<BaseServiceModel> fetchcitizensectorListData(citizenType,serviceArea,subgroupId,activityId,) async {
    final response = await _provider.get(SectorSet+Client+Filter+ "%27"+ citizenType+"%27" +ServiceArea+ "%27"+ serviceArea+"%27"+ SubGroupId+ "%27"+ subgroupId+"%27"+ActivityID+"%27"+ activityId+"%27") ;
    return BaseServiceModel.fromJson(response);
  }

  
  
}
 