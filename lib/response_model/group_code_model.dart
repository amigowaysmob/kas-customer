class GroupCodeModel {
  String? text;
  List<String>? data;

  GroupCodeModel({this.text, this.data});

  GroupCodeModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    data = json['data'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['data'] = this.data;
    return data;
  }
}
