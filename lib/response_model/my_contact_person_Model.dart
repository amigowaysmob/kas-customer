class ContactPersonModel {
  String? text;
  String? message;
  List<Data>? data;

  ContactPersonModel({this.text, this.message, this.data});

  ContactPersonModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  String? designation;
  String? mobileNumber;
  String? whatsappNumber;
  String? email;

  Data(
      {this.name,
      this.designation,
      this.mobileNumber,
      this.whatsappNumber,
      this.email});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    designation = json['designation'];
    mobileNumber = json['mobile_number'];
    whatsappNumber = json['whatsapp_number'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['designation'] = this.designation;
    data['mobile_number'] = this.mobileNumber;
    data['whatsapp_number'] = this.whatsappNumber;
    data['email'] = this.email;
    return data;
  }
}
