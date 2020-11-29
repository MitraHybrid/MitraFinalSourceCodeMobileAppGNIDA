import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:navigationdrawer/Network/ApiResponse.dart';
import 'package:navigationdrawer/Network/AppException.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';

class ApiBase {
  final String url;
  static var filter;
  static var format;
  static var username = 'GNIDA-MOB';
  static var password = 'sap@mob1';

  ApiBase({this.url});
  static var basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));

  Future<dynamic> get(String category) async {
    try {
      http.Response response = await http.get(Base_server_URL + category,
          headers: <String, String>{'authorization': basicAuth});
      print(Base_server_URL + category);
      print(response.statusCode);
      print(response.body);
      var responseJson = _proceesRequest(response);
      return responseJson;
    } on SocketException {
      FetchDataException("No Internet connections");
    } catch (error) {
      ApiResponse.error(error.toString());
    }
  }

  Future<dynamic> post() async {
    try {
      http.Response response = await http.post(Post_service_URL,
          headers: <String, String>{
            'authorization': basicAuth,
            'Content-type': 'application/json; charset=UTF-8',
            'X-CSRF-TOKEN': 'Fetch',
            'X-Requested-With': 'X',
            'sap-client':'830'
          }, );
      print(Base_server_URL);
      print(response.statusCode);
      print(response.body);
      var responseJson = _proceesRequest(response);
      return responseJson;
    } on SocketException {
      FetchDataException("No Internet connections");
    } catch (error) {
      ApiResponse.error(error.toString());
    }
  }

  dynamic _proceesRequest(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}







class ServiceManager extends ApiBase {
  ServiceManager(serviceUrl) : super(url: Base_server_URL + serviceUrl);
}
