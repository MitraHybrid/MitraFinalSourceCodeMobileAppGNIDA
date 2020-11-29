class ConcernPersonModel {
	D d;

	ConcernPersonModel({this.d});

	ConcernPersonModel.fromJson(Map<String, dynamic> json) {
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
	Metadata mMetadata;
	String sectorID;
	String concernName;
	String concernMobile;
  String concernDesignation;

	D({this.mMetadata, this.sectorID, this.concernName, this.concernMobile});

	D.fromJson(Map<String, dynamic> json) {
		mMetadata = json['__metadata'] != null ? new Metadata.fromJson(json['__metadata']) : null;
		sectorID = json['SectorID'];
		concernName = json['ConcernName'];
		concernMobile = json['ConcernMobile'];
    concernDesignation = json['ConcernDesignation'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.mMetadata != null) {
      data['__metadata'] = this.mMetadata.toJson();
    }
		data['SectorID'] = this.sectorID;
		data['ConcernName'] = this.concernName;
		data['ConcernMobile'] = this.concernMobile;
    data['ConcernDesignation'] = this.concernDesignation;
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