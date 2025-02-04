class InviteModel {
  String? text;
  Data? data;

  InviteModel({this.text, this.data});

  InviteModel.fromJson(Map<String, dynamic> json) {
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
  String? referralKey;

  Data({this.langData, this.referralKey});

  Data.fromJson(Map<String, dynamic> json) {
    langData = json['lang_data'] != null
        ? new LangData.fromJson(json['lang_data'])
        : null;
    referralKey = json['referral_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.langData != null) {
      data['lang_data'] = this.langData!.toJson();
    }
    data['referral_key'] = this.referralKey;
    return data;
  }
}

class LangData {
  String? inviteYourFriends;
  String? copyInvite;
  String? date;
  String? referralEarnings;
  String? empId;
  String? empName;
  String? yourEarnings;
  String? referralLinkCopied;
  String? referralContent;

  LangData(
      {this.inviteYourFriends,
      this.copyInvite,
      this.date,
      this.referralEarnings,
      this.empId,
      this.empName,
      this.yourEarnings,
      this.referralLinkCopied,
      this.referralContent});

  LangData.fromJson(Map<String, dynamic> json) {
    inviteYourFriends = json['invite_your_friends'];
    copyInvite = json['copy_invite'];
    date = json['date'];
    referralEarnings = json['referral_earnings'];
    empId = json['emp_id'];
    empName = json['emp_name'];
    yourEarnings = json['your_earnings'];
    referralLinkCopied = json['referral_link_copied'];
    referralContent = json['referral_content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invite_your_friends'] = this.inviteYourFriends;
    data['copy_invite'] = this.copyInvite;
    data['date'] = this.date;
    data['referral_earnings'] = this.referralEarnings;
    data['emp_id'] = this.empId;
    data['emp_name'] = this.empName;
    data['your_earnings'] = this.yourEarnings;
    data['referral_link_copied'] = this.referralLinkCopied;
    data['referral_content'] = this.referralContent;
    return data;
  }
}
