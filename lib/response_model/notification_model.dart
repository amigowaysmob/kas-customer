class NotificationModel {
  String? text;
  Data? data;

  NotificationModel({this.text, this.data});

  NotificationModel.fromJson(Map<String, dynamic> json) {
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
  List<NotificationData>? notificationData;

  Data({this.langData, this.notificationData});

  Data.fromJson(Map<String, dynamic> json) {
    langData = json['lang_data'] != null
        ? new LangData.fromJson(json['lang_data'])
        : null;
    if (json['notification_data'] != null) {
      notificationData = <NotificationData>[];
      json['notification_data'].forEach((v) {
        notificationData!.add(new NotificationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.langData != null) {
      data['lang_data'] = this.langData!.toJson();
    }
    if (this.notificationData != null) {
      data['notification_data'] =
          this.notificationData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LangData {
  String? notifications;

  LangData({this.notifications});

  LangData.fromJson(Map<String, dynamic> json) {
    notifications = json['notifications'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notifications'] = this.notifications;
    return data;
  }
}

class NotificationData {
  String? id;
  String? title;
  String? content;
  String? image;
  String? created;
  String? pageType;
  String? notificationId;
  String? userId;
  String? source;

  NotificationData(
      {this.id,
      this.title,
      this.content,
      this.image,
      this.created,
      this.pageType,
      this.notificationId,
      this.userId,
      this.source});

  NotificationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    created = json['created'];
    pageType = json['page_type'];
    notificationId = json['notification_id'];
    userId = json['user_id'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['image'] = this.image;
    data['created'] = this.created;
    data['page_type'] = this.pageType;
    data['notification_id'] = this.notificationId;
    data['user_id'] = this.userId;
    data['source'] = this.source;
    return data;
  }
}
