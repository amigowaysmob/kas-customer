class GalleryModel {
  String? text;
  Data? data;

  GalleryModel({this.text, this.data});

  GalleryModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  LangData? langData;
  List<GalleryData>? galleryData;

  Data({this.langData, this.galleryData});

  Data.fromJson(Map<String, dynamic> json) {
    langData = json['lang_data'] != null
        ? new LangData.fromJson(json['lang_data'])
        : null;
    if (json['gallery_data'] != null) {
      galleryData = <GalleryData>[];
      json['gallery_data'].forEach((v) {
        galleryData!.add(new GalleryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.langData != null) {
      data['lang_data'] = this.langData!.toJson();
    }
    if (this.galleryData != null) {
      data['gallery_data'] = this.galleryData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LangData {
  String? imagesGallery;

  LangData({this.imagesGallery});

  LangData.fromJson(Map<String, dynamic> json) {
    imagesGallery = json['images_gallery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images_gallery'] = this.imagesGallery;
    return data;
  }
}

class GalleryData {
  String? id;
  String? title;
  String? screenshot;
  String? type;
  String? value;
  String? link;
  String? status;

  GalleryData(
      {this.id,
      this.title,
      this.screenshot,
      this.type,
      this.value,
      this.link,
      this.status});

  GalleryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    screenshot = json['screenshot'];
    type = json['type'];
    value = json['value'];
    link = json['link'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['screenshot'] = this.screenshot;
    data['type'] = this.type;
    data['value'] = this.value;
    data['link'] = this.link;
    data['status'] = this.status;
    return data;
  }
}
