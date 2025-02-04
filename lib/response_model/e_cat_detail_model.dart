class ECatDetailModel {
  String? text;
  String? message;
  Data? data;

  ECatDetailModel({this.text, this.message, this.data});

  ECatDetailModel.fromJson(Map<String, dynamic> json) {
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
  ProductData? productData;
  List<RelatedProducts>? relatedProducts;
  ContactDetails? contactDetails;

  Data({this.productData, this.relatedProducts, this.contactDetails});

  Data.fromJson(Map<String, dynamic> json) {
    productData = json['product_data'] != null
        ? new ProductData.fromJson(json['product_data'])
        : null;
    if (json['related_products'] != null) {
      relatedProducts = <RelatedProducts>[];
      json['related_products'].forEach((v) {
        relatedProducts!.add(new RelatedProducts.fromJson(v));
      });
    }
    contactDetails = json['contact_details'] != null
        ? new ContactDetails.fromJson(json['contact_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productData != null) {
      data['product_data'] = this.productData!.toJson();
    }
    if (this.relatedProducts != null) {
      data['related_products'] =
          this.relatedProducts!.map((v) => v.toJson()).toList();
    }
    if (this.contactDetails != null) {
      data['contact_details'] = this.contactDetails!.toJson();
    }
    return data;
  }
}

class ProductData {
  String? id;
  String? productId;
  String? userId;
  String? categoryId;
  String? sku;
  String? productName;
  String? seourl;
  String? salePrice;
  String? regPrice;
  String? weight;
  String? proImg;
  List<String>? proSnaps;
  String? shortDescription;
  String? description;
  String? similarProducts;
  String? purchasedCount;
  String? viewCount;
  String? proCreated;
  String? modified;
  String? status;

  ProductData(
      {this.id,
      this.productId,
      this.userId,
      this.categoryId,
      this.sku,
      this.productName,
      this.seourl,
      this.salePrice,
      this.regPrice,
      this.weight,
      this.proImg,
      this.proSnaps,
      this.shortDescription,
      this.description,
      this.similarProducts,
      this.purchasedCount,
      this.viewCount,
      this.proCreated,
      this.modified,
      this.status});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    sku = json['sku'];
    productName = json['product_name'];
    seourl = json['seourl'];
    salePrice = json['sale_price'];
    regPrice = json['reg_price'];
    weight = json['weight'];
    proImg = json['pro_img'];
    proSnaps = json['pro_snaps'].cast<String>();
    shortDescription = json['short_description'];
    description = json['description'];
    similarProducts = json['similar_products'];
    purchasedCount = json['purchasedCount'];
    viewCount = json['view_count'];
    proCreated = json['pro_created'];
    modified = json['modified'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['sku'] = this.sku;
    data['product_name'] = this.productName;
    data['seourl'] = this.seourl;
    data['sale_price'] = this.salePrice;
    data['reg_price'] = this.regPrice;
    data['weight'] = this.weight;
    data['pro_img'] = this.proImg;
    data['pro_snaps'] = this.proSnaps;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['similar_products'] = this.similarProducts;
    data['purchasedCount'] = this.purchasedCount;
    data['view_count'] = this.viewCount;
    data['pro_created'] = this.proCreated;
    data['modified'] = this.modified;
    data['status'] = this.status;
    return data;
  }
}

class RelatedProducts {
  String? id;
  String? productName;
  String? price;
  String? sku;
  String? weight;
  String? image;

  RelatedProducts(
      {this.id,
      this.productName,
      this.price,
      this.sku,
      this.weight,
      this.image});

  RelatedProducts.fromJson(Map<String, dynamic> json) {
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

class ContactDetails {
  String? siteContactNumber;
  String? siteContactWhatsapp;

  ContactDetails({this.siteContactNumber, this.siteContactWhatsapp});

  ContactDetails.fromJson(Map<String, dynamic> json) {
    siteContactNumber = json['site_contact_number'];
    siteContactWhatsapp = json['site_contact_whatsapp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['site_contact_number'] = this.siteContactNumber;
    data['site_contact_whatsapp'] = this.siteContactWhatsapp;
    return data;
  }
}
