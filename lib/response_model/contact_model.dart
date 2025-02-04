class ContactModel {
  String? text;
  Data? data;

  ContactModel({this.text, this.data});

  ContactModel.fromJson(Map<String, dynamic> json) {
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
  UserData? userData;
  ContactData? contactData;
  List<String>? subjectTypes;

  Data({this.userData, this.contactData, this.subjectTypes});

  Data.fromJson(Map<String, dynamic> json) {
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
    contactData = json['contact_data'] != null
        ? new ContactData.fromJson(json['contact_data'])
        : null;
    subjectTypes = json['subject_types'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    if (this.contactData != null) {
      data['contact_data'] = this.contactData!.toJson();
    }
    data['subject_types'] = this.subjectTypes;
    return data;
  }
}

class UserData {
  String? name;
  String? email;
  String? phone;

  UserData({this.name, this.email, this.phone});

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}

class ContactData {
  String? id;
  String? email;
  String? address;
  List<ContactNameNumbers>? contactNameNumbers;
  List<ContactNameNumbers>? whatsappNameNumbers;

  ContactData(
      {this.id,
      this.email,
      this.address,
      this.contactNameNumbers,
      this.whatsappNameNumbers});

  ContactData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    address = json['address'];
    if (json['contact_name_numbers'] != null) {
      contactNameNumbers = <ContactNameNumbers>[];
      json['contact_name_numbers'].forEach((v) {
        contactNameNumbers!.add(new ContactNameNumbers.fromJson(v));
      });
    }
    if (json['whatsapp_name_numbers'] != null) {
      whatsappNameNumbers = <ContactNameNumbers>[];
      json['whatsapp_name_numbers'].forEach((v) {
        whatsappNameNumbers!.add(new ContactNameNumbers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['address'] = this.address;
    if (this.contactNameNumbers != null) {
      data['contact_name_numbers'] =
          this.contactNameNumbers!.map((v) => v.toJson()).toList();
    }
    if (this.whatsappNameNumbers != null) {
      data['whatsapp_name_numbers'] =
          this.whatsappNameNumbers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContactNameNumbers {
  String? name;
  String? number;

  ContactNameNumbers({this.name, this.number});

  ContactNameNumbers.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['number'] = this.number;
    return data;
  }
}
