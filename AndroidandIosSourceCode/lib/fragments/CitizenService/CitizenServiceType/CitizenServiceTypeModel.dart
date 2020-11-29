class CitizenServiceTypeModel {
  D d;

  CitizenServiceTypeModel({this.d});

  CitizenServiceTypeModel.fromJson(Map<String, dynamic> json) {
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
  String serviceArea;
  String matGroup;

  Results({this.mMetadata, this.mainServID, this.serviceArea, this.matGroup});

  Results.fromJson(Map<String, dynamic> json) {
    mMetadata = json['__metadata'] != null
        ? new Metadata.fromJson(json['__metadata'])
        : null;
    mainServID = json['MainServID'];
    serviceArea = json['ServiceArea'];
    matGroup = json['MatGroup'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mMetadata != null) {
      data['__metadata'] = this.mMetadata.toJson();
    }
    data['MainServID'] = this.mainServID;
    data['ServiceArea'] = this.serviceArea;
    data['MatGroup'] = this.matGroup;
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