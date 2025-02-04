
import 'dart:io';
import 'package:path/path.dart';
import 'package:dio/dio.dart';

class UpdateProfilePhotoRequestModel{
  String? userId;
 
  File? photo;

  UpdateProfilePhotoRequestModel({
    this.userId,
    
    this.photo
  });
  factory UpdateProfilePhotoRequestModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfilePhotoRequestModel(
      userId: json['user_id'],

photo:json['photo'],
    );
}
 Map<String, dynamic> toJson() {
    return {
      'user_id':userId,
     
      'photo' :photo,
    };}

 Future<FormData> toFormData() async {
    final formData = FormData();
 if (userId != null) formData.fields.add(MapEntry('user_id', userId!));


     if (photo != null) {
      formData.files.add(MapEntry(
        'photo',
        await MultipartFile.fromFile(photo!.path, filename: basename(photo!.path)),
      ));
    }
    return formData;
  }
}