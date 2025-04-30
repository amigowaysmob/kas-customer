class FeedSubCatRequestModel {
  String? userId;
  String? categoryId;
  String? lang;

  FeedSubCatRequestModel({this.userId, this.categoryId, this.lang});

  FeedSubCatRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    categoryId = json['category_id'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['lang'] = this.lang;
    return data;
  }
}
