class RegisterRequestModel {
  String? email;
  String? fullName;
  String? phoneNumber;

  RegisterRequestModel({this.email, this.fullName, this.phoneNumber});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['full_name'] = this.fullName;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}
