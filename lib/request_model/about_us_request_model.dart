class AboutUsRequestModel {
  String? seourl;
  String? lang;

  AboutUsRequestModel({this.seourl, this.lang});

  AboutUsRequestModel.fromJson(Map<String, dynamic> json) {
    seourl = json['seourl'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seourl'] = this.seourl;
    data['lang'] = this.lang;
    return data;
  }
}
