class FeedBackRequestModel {
  String? userId;
  String? feedback;
  String? rating;
  String? lang;

  FeedBackRequestModel({this.userId, this.feedback, this.rating, this.lang});

  FeedBackRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    feedback = json['feedback'];
    rating = json['rating'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['feedback'] = this.feedback;
    data['rating'] = this.rating;
    data['lang'] = this.lang;
    return data;
  }
}
