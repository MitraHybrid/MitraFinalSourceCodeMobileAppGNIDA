



import 'package:navigationdrawer/Network/ApiBase.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';
import 'package:navigationdrawer/fragments/BaseService/BaseServiceModel.dart';


class BaseServiceMainBlocRepository{

ApiBase _provider = ApiBase ();

 Future<BaseServiceModel> fetchBaseServiceData() async {
    final response = await _provider.get(BaseUrl);
    return BaseServiceModel.fromJson(response);
  }
  
}
 