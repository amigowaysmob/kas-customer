class LedgerDetailRequestModel {
  String? userId;
  String? id;
  String? chitCloseDetail;
  String? lang;

  LedgerDetailRequestModel(
      {this.userId, this.id, this.chitCloseDetail, this.lang});

  LedgerDetailRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    id = json['id'];
    chitCloseDetail = json['chit_close_detail'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['id'] = this.id;
    data['chit_close_detail'] = this.chitCloseDetail;
    data['lang'] = this.lang;
    return data;
  }
}
