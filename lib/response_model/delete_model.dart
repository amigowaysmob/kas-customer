class DeleteModel {
  String? text;
  String? message;

  DeleteModel({this.text, this.message});

  DeleteModel.fromJson(Map<String, dynamic> json) {
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
