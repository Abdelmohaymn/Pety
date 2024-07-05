



import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pety/features/community/community_screen/models/get_posts_response.dart';
import 'package:pety/features/community/community_screen/models/post_votes_body.dart';
import 'package:pety/shared/network/local/shared_pred_constants.dart';
import 'package:pety/shared/network/local/shared_pref_helper.dart';
import 'package:pety/shared/network/remote/api_result.dart';
import 'package:pety/shared/network/remote/api_service.dart';
import 'package:pety/shared/network/remote/error_handler.dart';

class CommunityRepository {
  final ApiService _apiService ;
  final ImagePicker _imagePicker;

  CommunityRepository(
      this._apiService,
      this._imagePicker
  );

  Future<File?> pickImage() async{
    final pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
    if(pickedImage != null){
      return File(pickedImage.path);
    }
    return null;
  }

  Future<ApiResult<void>> createPost({required FormData postBody}) async{
    try{
      final void response = await _apiService.createPost(
          postBody,
          'Bearer ${SharedPrefHelper.getData(key: SharedPrefConstants.tokenKey)}'
      );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetPostsResponse>> getPosts() async{
    try{
      final GetPostsResponse response = await _apiService.getPosts();
      if (response.data != null) {
        response.data = response.data!.map((item) {
          item.createdAt = calculateDate(item.createdAt!);
          return item;
        }).toList();
      }
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> upVotePost({required PostVotesBody voteBody}) async{
    try{
      final void response = await _apiService.upVotePost(
          voteBody,
          'Bearer ${SharedPrefHelper.getData(key: SharedPrefConstants.tokenKey)}'
      );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> downVotePost({required PostVotesBody voteBody}) async{
    try{
      final void response = await _apiService.downVotePost(
          voteBody,
          'Bearer ${SharedPrefHelper.getData(key: SharedPrefConstants.tokenKey)}'
      );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> resetVotePost({required PostVotesBody voteBody}) async{
    try{
      final void response = await _apiService.resetVotePost(
          voteBody,
          'Bearer ${SharedPrefHelper.getData(key: SharedPrefConstants.tokenKey)}'
      );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  String calculateDate(String dateTimeString){
    final DateTime parsedDateTime = DateTime.parse(dateTimeString);
    final DateTime now = DateTime.now();
    final Duration duration = now.difference(parsedDateTime);

    if (duration.inSeconds < 60) {
      return 'Just now';
    } else if (duration.inMinutes < 60) {
      return '${duration.inMinutes} minute ago';
    } else if (duration.inHours < 24) {
      return '${duration.inHours} hour ago';
    } else if (duration.inDays < 30) {
      return '${duration.inDays} day ago';
    } else {
      final int months = duration.inDays ~/ 30;
      if (months < 12) {
        return '$months month ago';
      } else {
        final int years = duration.inDays ~/ 365;
        return '$years year ago';
      }
    }
  }


}
