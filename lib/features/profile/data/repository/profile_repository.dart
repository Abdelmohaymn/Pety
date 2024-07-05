
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pety/features/profile/data/models/update_profile_response.dart';
import 'package:pety/features/profile/user_visits_screen/models/user_visits_response.dart';
import 'package:pety/shared/network/local/shared_pred_constants.dart';
import 'package:pety/shared/network/local/shared_pref_helper.dart';
import 'package:pety/shared/network/remote/api_result.dart';
import 'package:pety/shared/network/remote/api_service.dart';
import 'package:pety/shared/network/remote/error_handler.dart';

class ProfileRepository {
  final ApiService _apiService ;
  final ImagePicker _imagePicker;

  ProfileRepository(
    this._apiService,
    this._imagePicker
  );

  Future<ApiResult<UpdateProfileResponse>> updateProfile({required FormData profileBody}) async{
    try{
      final UpdateProfileResponse response = await _apiService.updateProfile(
          profileBody,
          'Bearer ${SharedPrefHelper.getData(key: SharedPrefConstants.tokenKey)}'
      );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<File?> pickImage() async{
    final pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
    if(pickedImage != null){
      return File(pickedImage.path);
    }
    return null;
  }

  // user visits
  Future<ApiResult<UserVisitsResponse>> getUserVisits() async{
    try{
      final UserVisitsResponse response = await _apiService.getUserVisits(
          'Bearer ${SharedPrefHelper.getData(key: SharedPrefConstants.tokenKey)}'
      );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}