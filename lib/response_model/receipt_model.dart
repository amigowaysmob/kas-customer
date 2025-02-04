class ReceiptModel {
  String? text;
  Data? data;
  String? link;

  ReceiptModel({this.text, this.data, this.link});

  ReceiptModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['link'] = this.link;
    return data;
  }
}

class Data {
  LangData? langData;

  Data({this.langData});

  Data.fromJson(Map<String, dynamic> json) {
    langData = json['lang_data'] != null
        ? new LangData.fromJson(json['lang_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.langData != null) {
      data['lang_data'] = this.langData!.toJson();
    }
    return data;
  }
}

class LangData {
  String? download;
  String? close;
  String? downloadReceipt;

  LangData({this.download, this.close, this.downloadReceipt});

  LangData.fromJson(Map<String, dynamic> json) {
    download = json['download'];
    close = json['close'];
    downloadReceipt = json['download_receipt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['download'] = this.download;
    data['close'] = this.close;
    data['download_receipt'] = this.downloadReceipt;
    return data;
  }
}
