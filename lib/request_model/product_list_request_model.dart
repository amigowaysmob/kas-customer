class ProductListRequestModel {
  String? userId;
  String? lang;
  String? sortBy;
  String? size;
  String? category;

  ProductListRequestModel(
      {this.userId, this.lang, this.sortBy, this.size, this.category});

  ProductListRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    lang = json['lang'];
    sortBy = json['sort_by'];
    size = json['size'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['lang'] = this.lang;
    data['sort_by'] = this.sortBy;
    data['size'] = this.size;
    data['category'] = this.category;
    return data;
  }
}
