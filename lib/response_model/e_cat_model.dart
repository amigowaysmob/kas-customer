class ECatModel {
  String? text;
  String? message;
  List<Data>? data;

  ECatModel({this.text, this.message, this.data});

  ECatModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? productName;
  String? price;
  String? sku;
  String? weight;
  String? image;

  Data(
      {this.id,
      this.productName,
      this.price,
      this.sku,
      this.weight,
      this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    price = json['price'];
    sku = json['sku'];
    weight = json['weight'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['price'] = this.price;
    data['sku'] = this.sku;
    data['weight'] = this.weight;
    data['image'] = this.image;
    return data;
  }
}
