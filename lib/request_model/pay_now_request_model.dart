class PayNowRequestModel {
  String? userId;
  String? lang;
  String? totalAmount;
  List<String>? dues;
  List<String>? inputdues;

  PayNowRequestModel(
      {this.userId, this.lang, this.totalAmount, this.dues, this.inputdues});

  PayNowRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    lang = json['lang'];
    totalAmount = json['total_amount'];
    dues = json['dues'].cast<String>();
    inputdues = json['inputdues'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['lang'] = this.lang;
    data['total_amount'] = this.totalAmount;
    data['dues'] = this.dues;
    data['inputdues'] = this.inputdues;
    return data;
  }
}
