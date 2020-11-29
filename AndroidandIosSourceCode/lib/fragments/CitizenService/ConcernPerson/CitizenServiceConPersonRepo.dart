import 'package:navigationdrawer/Network/ApiBase.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';
import 'package:navigationdrawer/fragments/CitizenService/ConcernPerson/ConcernPersonModel.dart';

class CitizenServiceConPersonRepo {

ApiBase _provider = ApiBase ();

 Future<ConcernPersonModel> fetchConcerpersonPost(category) async {
    final response = await _provider.get(ConcernSet+"%28%27"+ category+"%27%29"+Client) ;
    return ConcernPersonModel.fromJson(response);
  }
}