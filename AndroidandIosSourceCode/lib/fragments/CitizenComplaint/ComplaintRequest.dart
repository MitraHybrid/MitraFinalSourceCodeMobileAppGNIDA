// To parse this JSON data, do
//
//     final complaintRequest = complaintRequestFromJson(jsonString);

import 'dart:convert';

ComplaintRequest complaintRequestFromJson(String str) => ComplaintRequest.fromJson(json.decode(str));

String complaintRequestToJson(ComplaintRequest data) => json.encode(data.toJson());

class ComplaintRequest {
    ComplaintRequest({
        this.d,
    });

    D d;

    factory ComplaintRequest.fromJson(Map<String, dynamic> json) => ComplaintRequest(
        d: D.fromJson(json["d"]),
    );

    Map<String, dynamic> toJson() => {
        "d": d.toJson(),
    };
}

class D {
    D({
        this.mainServId,
        this.serviceArea,
        this.subgroupId,
        this.sectorId,
        this.activityId,
        this.matGroup,
        this.custName,
        this.custMobile,
        this.custEmail,
        this.custAddress,
        this.compDesc,
        this.consPerName,
        this.consPerMobile,
        this.reqDate,
    });

    String mainServId;
    String serviceArea;
    String subgroupId;
    String sectorId;
    String activityId;
    String matGroup;
    String custName;
    String custMobile;
    String custEmail;
    String custAddress;
    String compDesc;
    String consPerName;
    String consPerMobile;
    String reqDate;

    factory D.fromJson(Map<String, dynamic> json) => D(
        mainServId: json["MainServID"],
        serviceArea: json["ServiceArea"],
        subgroupId: json["SubgroupID"],
        sectorId: json["SectorID"],
        activityId: json["ActivityID"],
        matGroup: json["MatGroup"],
        custName: json["CustName"],
        custMobile: json["CustMobile"],
        custEmail: json["CustEmail"],
        custAddress: json["CustAddress"],
        compDesc: json["CompDesc"],
        consPerName: json["ConsPerName"],
        consPerMobile: json["ConsPerMobile"],
        reqDate: json["ReqDate"],
    );

    Map<String, dynamic> toJson() => {
        "MainServID": mainServId,
        "ServiceArea": serviceArea,
        "SubgroupID": subgroupId,
        "SectorID": sectorId,
        "ActivityID": activityId,
        "MatGroup": matGroup,
        "CustName": custName,
        "CustMobile": custMobile,
        "CustEmail": custEmail,
        "CustAddress": custAddress,
        "CompDesc": compDesc,
        "ConsPerName": consPerName,
        "ConsPerMobile": consPerMobile,
        "ReqDate": reqDate,
    };
}
