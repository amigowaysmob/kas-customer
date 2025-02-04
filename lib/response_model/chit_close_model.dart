class ChitCloseModel {
  String? text;
  String? mesage;

  ChitCloseModel({this.text, this.mesage});

  ChitCloseModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    mesage = json['mesage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['mesage'] = this.mesage;
    return data;
  }
}
