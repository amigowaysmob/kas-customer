class PayOthersRequestModel {
  String? userId;
  String? searchTerm;
  String? lang;

  PayOthersRequestModel({this.userId, this.searchTerm, this.lang});

  PayOthersRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    searchTerm = json['search_term'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['search_term'] = this.searchTerm;
    data['lang'] = this.lang;
    return data;
  }
}
