class LuckyTermsModel {
  String? text;
  String? message;
  Data? data;

  LuckyTermsModel({this.text, this.message, this.data});

  LuckyTermsModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? video;
  String? content;

  Data({this.video, this.content});

  Data.fromJson(Map<String, dynamic> json) {
    video = json['video'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video'] = this.video;
    data['content'] = this.content;
    return data;
  }
}
