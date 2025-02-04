class CatListModel {
  String? text;
  String? message;
  Data? data;

  CatListModel({this.text, this.message, this.data});

  CatListModel.fromJson(Map<String, dynamic> json) {
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
  List<Category>? category;
  List<String>? size;

  Data({this.category, this.size});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
    size = json['size'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    data['size'] = this.size;
    return data;
  }
}

class Category {
  String? id;
  String? name;
  String? image;
  List<Subcatitems>? subcatitems;

  Category({this.id, this.name, this.image, this.subcatitems});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    if (json['subcatitems'] != null) {
      subcatitems = <Subcatitems>[];
      json['subcatitems'].forEach((v) {
        subcatitems!.add(new Subcatitems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    if (this.subcatitems != null) {
      data['subcatitems'] = this.subcatitems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subcatitems {
  String? id;
  String? name;
  String? image;

  Subcatitems({this.id, this.name, this.image});

  Subcatitems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
