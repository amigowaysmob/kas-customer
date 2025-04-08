class WinnersModel {
  String? text;
  String? message;
  Data? data;

  WinnersModel({this.text, this.message, this.data});

  WinnersModel.fromJson(Map<String, dynamic> json) {
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
  List<Winners>? winners;

  Data({this.video, this.winners});

  Data.fromJson(Map<String, dynamic> json) {
    video = json['video'];
    if (json['winners'] != null) {
      winners = <Winners>[];
      json['winners'].forEach((v) {
        winners!.add(new Winners.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video'] = this.video;
    if (this.winners != null) {
      data['winners'] = this.winners!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Winners {
  String? name;
  String? image;
  String? period;
  String? gram;
  String? video;

  Winners({this.name, this.image, this.period, this.gram, this.video});

  Winners.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    period = json['period'];
    gram = json['gram'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['period'] = this.period;
    data['gram'] = this.gram;
    data['video'] = this.video;
    return data;
  }
}
