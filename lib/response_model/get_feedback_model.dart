class GetFeedBackModel {
  String? text;
  String? message;
  List<Data>? data;

  GetFeedBackModel({this.text, this.message, this.data});

  GetFeedBackModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    message = json['message'];
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
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? feedback;
  String? rating;
  String? name;
  String? image;

  Data({this.feedback, this.rating, this.name, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    feedback = json['feedback'];
    rating = json['rating'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feedback'] = this.feedback;
    data['rating'] = this.rating;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
