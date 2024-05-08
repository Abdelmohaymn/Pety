
import 'package:pety/features/pety_layout/data/models/chat_bot_body.dart';
import 'package:pety/features/pety_layout/data/models/chat_bot_response.dart';
import 'package:pety/shared/network/remote/api_result.dart';
import 'package:pety/shared/network/remote/chatbot_api/chatbot_service.dart';
import 'package:pety/shared/network/remote/error_handler.dart';

class PetyRepository{
  final ChatBotService _chatBotService;
  PetyRepository(this._chatBotService);

  Future<ApiResult<ChatBotResponse>> predictMessages(ChatBotBody chatBotBody) async{
    try{
      final response = await _chatBotService.predictMessages(chatBotBody);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}