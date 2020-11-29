
class SearchResult {
     final String serviceID;
     final String activityID;
     final String activityDesc;
     final String errorMsg;

  SearchResult({this.serviceID, this.activityID, this.activityDesc, this.errorMsg});

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
        serviceID: json['serviceID'],
        activityID: json['activityID'],
        activityDesc: json['activityDesc'],
        errorMsg: json['errorMsg']);
  }
}
     