import 'dart:async';
import 'package:navigationdrawer/Network/ApiResponse.dart';
import 'package:navigationdrawer/fragments/CitizenComplaint/CitizenComplaintBlocRepo.dart';
import 'package:navigationdrawer/fragments/CitizenComplaint/ComplaintRequest.dart';

// ignore: camel_case_types
class CitizenComplaint_MainBloc {
  CitizenComplaintBlocRepo _citizenComplaintBlocRepo;
  StreamController _citizenServiceComplaintController;

  StreamSink<ApiResponse<ComplaintRequest>> get citizenserviceComplaintSink =>
      _citizenServiceComplaintController.sink;

  Stream<ApiResponse<ComplaintRequest>> get citizenserviceComplaintStream =>
      _citizenServiceComplaintController.stream;

  CitizenComplaint_MainBloc(String category) {
    _citizenServiceComplaintController =
        StreamController<ApiResponse<ComplaintRequest>>();
    _citizenComplaintBlocRepo = CitizenComplaintBlocRepo();
    fetchComplaint(category);
  }

  fetchComplaint(category) async {
    citizenserviceComplaintSink.add(ApiResponse.loading('please wait'));
    try {
      ComplaintRequest citizenComplaintdata =
          await _citizenComplaintBlocRepo.postComplaintData(category);
      citizenserviceComplaintSink.add(ApiResponse.completed(citizenComplaintdata));
    } catch (e) {
      citizenserviceComplaintSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _citizenServiceComplaintController?.close();
  }
}
