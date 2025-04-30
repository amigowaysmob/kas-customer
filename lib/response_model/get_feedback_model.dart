class GetFeedBackModel {
  String? text;
  String? message;
  Data? data;

  GetFeedBackModel({this.text, this.message, this.data});

  GetFeedBackModel.fromJson(Map<String, dynamic> json) {
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
  List<Reviews>? reviews;
  List<Tickets>? tickets;

  Data({this.reviews, this.tickets});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    if (json['tickets'] != null) {
      tickets = <Tickets>[];
      json['tickets'].forEach((v) {
        tickets!.add(new Tickets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    if (this.tickets != null) {
      data['tickets'] = this.tickets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  String? id;
  String? feedback;
  String? rating;
  String? name;
  String? image;
  String? dateTime;

  Reviews(
      {this.id,
      this.feedback,
      this.rating,
      this.name,
      this.image,
      this.dateTime});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    feedback = json['feedback'];
    rating = json['rating'];
    name = json['name'];
    image = json['image'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['feedback'] = this.feedback;
    data['rating'] = this.rating;
    data['name'] = this.name;
    data['image'] = this.image;
    data['date_time'] = this.dateTime;
    return data;
  }
}

class Tickets {
  String? id;
  String? ticketNo;
  String? title;
  String? description;
  String? dateTime;
  String? ticketType;
  String? issueType;
  String? status;

  Tickets(
      {this.id,
      this.ticketNo,
      this.title,
      this.description,
      this.dateTime,
      this.ticketType,
      this.issueType,
      this.status});

  Tickets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ticketNo = json['ticket_no'];
    title = json['title'];
    description = json['description'];
    dateTime = json['date_time'];
    ticketType = json['ticket_type'];
    issueType = json['issue_type'];
    status=json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ticket_no'] = this.ticketNo;
    data['title'] = this.title;
    data['description'] = this.description;
    data['date_time'] = this.dateTime;
    data['ticket_type'] = this.ticketType;
    data['issue_type'] = this.issueType;
    data['status']=this.status;
    return data;
  }
}
