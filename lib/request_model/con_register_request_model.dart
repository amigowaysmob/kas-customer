class ConRegisterRequestModel {
  String? email;
  String? fullName;
  String? phoneNumber;
  String? referBy;

  ConRegisterRequestModel(
      {this.email, this.fullName, this.phoneNumber, this.referBy});

  ConRegisterRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];
    referBy = json['refer_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['full_name'] = this.fullName;
    data['phone_number'] = this.phoneNumber;
    data['refer_by'] = this.referBy;
    return data;
  }
}
