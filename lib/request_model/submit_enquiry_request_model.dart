class SubmitEnquiryRequestModel {
  String? userId;
  String? fullname;
  String? email;
  String? phone;
  String? subject;
  String? message;
  String? lang;

  SubmitEnquiryRequestModel(
      {this.userId,
      this.fullname,
      this.email,
      this.phone,
      this.subject,
      this.message,
      this.lang});

  SubmitEnquiryRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    fullname = json['fullname'];
    email = json['email'];
    phone = json['phone'];
    subject = json['subject'];
    message = json['message'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['subject'] = this.subject;
    data['message'] = this.message;
    data['lang'] = this.lang;
    return data;
  }
}
