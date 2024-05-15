
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pety/features/pety_layout/data/models/chat_bot_body.dart';
import 'package:pety/features/pety_layout/data/models/chat_bot_response.dart';
import 'package:pety/features/pety_layout/find_my_pet/models/cities_model.dart';
import 'package:pety/features/pety_layout/find_my_pet/models/find_pet_body.dart';
import 'package:pety/features/pety_layout/find_my_pet/models/find_pet_response.dart';
import 'package:pety/features/pety_layout/find_my_pet/models/governments_model.dart';
import 'package:pety/features/pety_layout/find_my_pet/models/upload_pet_response.dart';
import 'package:pety/shared/network/remote/api_result.dart';
import 'package:pety/shared/network/remote/chatbot_api/chatbot_service.dart';
import 'package:pety/shared/network/remote/error_handler.dart';
import 'package:pety/shared/network/remote/find_pet_api/find_pet_service.dart';

class PetyRepository{
  final ChatBotService _chatBotService;
  final FindPetService _findPetService;
  final ImagePicker _imagePicker;
  PetyRepository(this._chatBotService,this._findPetService,this._imagePicker);

  // chatBot
  Future<ApiResult<ChatBotResponse>> predictMessages(ChatBotBody chatBotBody) async{
    try{
      final response = await _chatBotService.predictMessages(chatBotBody);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  // find my pet
  Future<List<GovernmentsModel>> fetchGovernmentsFromJson() async {
    // Load JSON file as a string
    String jsonString = await rootBundle.loadString('assets/jsons/governorates.json');
    // Decode JSON string into Dart object
    List<dynamic> jsonList = json.decode(jsonString);
    // Convert List<dynamic> to List<DataModel>
    List<GovernmentsModel> data = jsonList.map((json) => GovernmentsModel.fromJson(json)).toList();

    return data;
  }

  Future<List<CitiesModel>> fetchCitiesFromJson() async {
    // Load JSON file as a string
    String jsonString = await rootBundle.loadString('assets/jsons/cities.json');
    // Decode JSON string into Dart object
    List<dynamic> jsonList = json.decode(jsonString);
    // Convert List<dynamic> to List<DataModel>
    List<CitiesModel> data = jsonList.map((json) => CitiesModel.fromJson(json)).toList();

    return data;
  }

  Future<File?> pickImage() async{
    final pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
    if(pickedImage != null){
      return File(pickedImage.path);
    }
    return null;
  }

  Future<ApiResult<UploadPetResponse>> uploadMissingPet(FindPetBody findPetBody) async{
    try{
      final response = await _findPetService.uploadMissingPet(findPetBody);
      return ApiResult.success(response);
    }catch(error){
      print('ERRRRRRRRRRRRRRRRRRrr $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<FindPetResponse>> findMissingPet(FindPetBody findPetBody) async{
    try{
      final response = await _findPetService.findMissingPet(findPetBody);
      return ApiResult.success(response);
    }catch(error){
      print('ERRRRRRRRRRRRRRRRRRRR $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


}