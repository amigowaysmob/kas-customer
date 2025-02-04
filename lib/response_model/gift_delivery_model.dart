class GiftDeliveryModel {
  String? text;
  String? message;
  String? link;

  GiftDeliveryModel({this.text, this.message, this.link});

  GiftDeliveryModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    message = json['message'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['message'] = this.message;
    data['link'] = this.link;
    return data;
  }
}
