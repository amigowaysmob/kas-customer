class PayDueRequestModel {
  String? userId;
  String? customerId;
  String? id;
  String? lang;

  PayDueRequestModel({this.userId, this.customerId, this.id, this.lang});

  PayDueRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    customerId = json['customer_id'];
    id = json['id'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['customer_id'] = this.customerId;
    data['id'] = this.id;
    data['lang'] = this.lang;
    return data;
  }
}
