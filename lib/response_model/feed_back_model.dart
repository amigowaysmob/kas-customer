class FeedBackModel {
  String? text;
  String? message;

  FeedBackModel({this.text, this.message});

  FeedBackModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['message'] = this.message;
    return data;
  }
}
