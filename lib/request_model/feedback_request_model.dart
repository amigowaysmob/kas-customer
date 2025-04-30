class FeedBackRequestModel {
  String? userId;
  String? feedback;
  String? rating;
  String? ratingTerm;
  String? ratingIssueType;
  String? lang;
  String? reviewId;

  FeedBackRequestModel(
      {this.userId,
      this.feedback,
      this.rating,
      this.ratingTerm,
      this.ratingIssueType,
      this.lang,
      this.reviewId});

  FeedBackRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    feedback = json['feedback'];
    rating = json['rating'];
    ratingTerm = json['rating_term'];
    ratingIssueType = json['rating_issue_type'];
    lang = json['lang'];
    reviewId=json['review_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['feedback'] = this.feedback;
    data['rating'] = this.rating;
    data['rating_term'] = this.ratingTerm;
    data['rating_issue_type'] = this.ratingIssueType;
    data['lang'] = this.lang;
    data['review_id']=this.reviewId;
    return data;
  }
}
