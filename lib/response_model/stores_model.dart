class StoresModel {
  String? text;
  Data? data;

  StoresModel({this.text, this.data});

  StoresModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<StoresData>? storesData;

  Data({this.storesData});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['stores_data'] != null) {
      storesData = <StoresData>[];
      json['stores_data'].forEach((v) {
        storesData!.add(new StoresData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.storesData != null) {
      data['stores_data'] = this.storesData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StoresData {
  String? id;
  String? address;
  String? landmark;
  String? name;
  String? image;
  String? contactPerson;
  String? contactNumber;
  String? openingTime;
  String? closingTime;
  String? map;
  String? showroomName;
  String? status;

  StoresData(
      {this.id,
      this.address,
      this.landmark,
      this.name,
      this.image,
      this.contactPerson,
      this.contactNumber,
      this.openingTime,
      this.closingTime,
      this.map,
      this.showroomName,
      this.status});

  StoresData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    landmark = json['landmark'];
    name = json['name'];
    image = json['image'];
    contactPerson = json['contact_person'];
    contactNumber = json['contact_number'];
    openingTime = json['opening_time'];
    closingTime = json['closing_time'];
    map = json['map'];
    showroomName = json['showroom_name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['landmark'] = this.landmark;
    data['name'] = this.name;
    data['image'] = this.image;
    data['contact_person'] = this.contactPerson;
    data['contact_number'] = this.contactNumber;
    data['opening_time'] = this.openingTime;
    data['closing_time'] = this.closingTime;
    data['map'] = this.map;
    data['showroom_name'] = this.showroomName;
    data['status'] = this.status;
    return data;
  }
}
