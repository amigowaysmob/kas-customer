class TransRequestModel {
  String? userId;
  String? searchTerm;
  String? paymentStatus;
  String? lang;

  TransRequestModel(
      {this.userId, this.searchTerm, this.paymentStatus, this.lang});

  TransRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    searchTerm = json['search_term'];
    paymentStatus = json['payment_status'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['search_term'] = this.searchTerm;
    data['payment_status'] = this.paymentStatus;
    data['lang'] = this.lang;
    return data;
  }
}
