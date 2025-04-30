class SubmitTicketRequestModel {
  String? userId;
  String? title;
  String? description;
  String? ticketType;
  String? issueType;
  String? lang;

  SubmitTicketRequestModel(
      {this.userId,
      this.title,
      this.description,
      this.ticketType,
      this.issueType,
      this.lang});

  SubmitTicketRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    ticketType = json['ticket_type'];
    issueType = json['issue_type'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['ticket_type'] = this.ticketType;
    data['issue_type'] = this.issueType;
    data['lang'] = this.lang;
    return data;
  }
}
