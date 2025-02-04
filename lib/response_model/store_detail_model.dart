class StoreDetailModel {
  String? text;
  Data? data;

  StoreDetailModel({this.text, this.data});

  StoreDetailModel.fromJson(Map<String, dynamic> json) {
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
  LangData? langData;
  StoreData? storeData;

  Data({this.langData, this.storeData});

  Data.fromJson(Map<String, dynamic> json) {
    langData = json['lang_data'] != null
        ? new LangData.fromJson(json['lang_data'])
        : null;
    storeData = json['store_data'] != null
        ? new StoreData.fromJson(json['store_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.langData != null) {
      data['lang_data'] = this.langData!.toJson();
    }
    if (this.storeData != null) {
      data['store_data'] = this.storeData!.toJson();
    }
    return data;
  }
}

class LangData {
  String? address;
  String? landmark;
  String? contactPerson;
  String? contactNumber;
  String? openingTime;
  String? closingTime;
  String? map;

  LangData(
      {this.address,
      this.landmark,
      this.contactPerson,
      this.contactNumber,
      this.openingTime,
      this.closingTime,
      this.map});

  LangData.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    landmark = json['landmark'];
    contactPerson = json['contact_person'];
    contactNumber = json['contact_number'];
    openingTime = json['opening_time'];
    closingTime = json['closing_time'];
    map = json['map'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['landmark'] = this.landmark;
    data['contact_person'] = this.contactPerson;
    data['contact_number'] = this.contactNumber;
    data['opening_time'] = this.openingTime;
    data['closing_time'] = this.closingTime;
    data['map'] = this.map;
    return data;
  }
}

class StoreData {
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

  StoreData(
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

  StoreData.fromJson(Map<String, dynamic> json) {
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
