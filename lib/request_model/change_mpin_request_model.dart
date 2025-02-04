class ChangeMpinRequestModel {
  String? userId;
  String? mpin;
  String? confirmMpin;
  String? currentMpin;

  ChangeMpinRequestModel(
      {this.userId, this.mpin, this.confirmMpin, this.currentMpin});

  ChangeMpinRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    mpin = json['mpin'];
    confirmMpin = json['confirm_mpin'];
    currentMpin = json['current_mpin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['mpin'] = this.mpin;
    data['confirm_mpin'] = this.confirmMpin;
    data['current_mpin'] = this.currentMpin;
    return data;
  }
}
