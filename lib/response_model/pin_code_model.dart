class PincodeModel {
  String? text;
  String? message;
  Data? data;

  PincodeModel({this.text, this.message, this.data});

  PincodeModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? district;
  String? division;
  List<String>? cities;

  Data({this.district, this.division, this.cities});

  Data.fromJson(Map<String, dynamic> json) {
    district = json['district'];
    division = json['division'];
    cities = json['cities'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['district'] = this.district;
    data['division'] = this.division;
    data['cities'] = this.cities;
    return data;
  }
}
