class TokenModel {
  String? text;
  String? data;

  TokenModel({this.text, this.data});

  TokenModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['data'] = this.data;
    return data;
  }
}
