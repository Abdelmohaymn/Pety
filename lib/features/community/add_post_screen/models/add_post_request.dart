

import 'dart:io';

import 'package:dio/dio.dart';

class AddPostRequest {

  String? title;
  String? context;
  String? tags;
  File? photo;

  AddPostRequest({
    this.title='.',
    this.context,
    this.tags,
    this.photo,
  });

  Map<String, dynamic> toJson(){
    return {
      'title': title,
      'context': context,
      'tags': tags,
    };
  }

  Future<FormData> toFormData() async{
    Map<String, dynamic> json = toJson();
    if(photo!=null){
      MultipartFile pic = await MultipartFile.fromFile(photo!.path, filename:photo!.path.split('/').last);
      json.putIfAbsent('photo', (){return pic;});
    }
    return FormData.fromMap(json);
  }

}