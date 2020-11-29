
import 'package:navigationdrawer/Network/ApiBase.dart';
import 'package:navigationdrawer/fragments/CitizenComplaint/ComplaintRequest.dart';

class CitizenComplaintBlocRepo{

ApiBase _provider = ApiBase ();

 Future<ComplaintRequest> postComplaintData(category) async {
    final response = await _provider.post();
    return ComplaintRequest.fromJson(response);
  }

  
  
}
 