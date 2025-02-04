class LangListModel {
  String? text;
  List<Data>? data;

  LangListModel({this.text, this.data});

  LangListModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? langCode;
  String? status;
  String? defaultLanguage;

  Data({this.id, this.name, this.langCode, this.status, this.defaultLanguage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    langCode = json['lang_code'];
    status = json['status'];
    defaultLanguage = json['default_language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lang_code'] = this.langCode;
    data['status'] = this.status;
    data['default_language'] = this.defaultLanguage;
    return data;
  }
}
