class BaseServiceModel {
  D d;

  BaseServiceModel({this.d});

  BaseServiceModel.fromJson(Map<String, dynamic> json) {
    d = json['d'] != null ? new D.fromJson(json['d']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.d != null) {
      data['d'] = this.d.toJson();
    }
    return data;
  }
}

class D {
  List<Results> results;

  D({this.results});

  D.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  Metadata mMetadata;
  String mainServID;
  String mainServDesc;
  String serviceArea;
  String subgroupID;
  String subgroupDec;
  String activityID;
  String activityDesc;
  String sectorID;
  String sectorDesc;

  Results(
      {this.mMetadata,
      this.mainServID,
      this.mainServDesc,
      this.serviceArea,
      this.subgroupID,
      this.activityDesc,
      this.activityID,
      this.subgroupDec,
      this.sectorID,
      this.sectorDesc});

  Results.fromJson(Map<String, dynamic> json) {
    mMetadata = json['__metadata'] != null
        ? new Metadata.fromJson(json['__metadata'])
        : null;
    mainServID = json['MainServID'];
    mainServDesc = json['MainServDesc'];
    serviceArea = json['ServiceArea'];
    subgroupID = json['SubgroupID'];
    subgroupDec = json['SubgroupDec'];
    activityID = json['ActivityID'];
    activityDesc = json['ActivityDesc'];
    sectorID = json['SectorID'];
    sectorDesc = json['SectorDesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mMetadata != null) {
      data['__metadata'] = this.mMetadata.toJson();
    }
    data['MainServID'] = this.mainServID;
    data['MainServDesc'] = this.mainServDesc;
    data['ServiceArea'] = this.serviceArea;
    data['SubgroupID'] = this.subgroupID;
    data['SubgroupDec'] = this.subgroupDec;
    data['ActivityID'] = this.activityID;
    data['ActivityDesc'] = this.activityDesc;
    data['SectorID'] = this.sectorID;
    data['SectorDesc'] = this.sectorDesc;
    return data;
  }
}

class Metadata {
  String id;
  String uri;
  String type;

  Metadata({this.id, this.uri, this.type});

  Metadata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uri = json['uri'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uri'] = this.uri;
    data['type'] = this.type;
    return data;
  }
}
