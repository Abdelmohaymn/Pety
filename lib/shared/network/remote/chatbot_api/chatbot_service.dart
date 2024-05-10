
import 'package:dio/dio.dart';
import 'package:pety/features/pety_layout/data/models/chat_bot_body.dart';
import 'package:pety/features/pety_layout/data/models/chat_bot_response.dart';
import 'package:pety/shared/network/remote/chatbot_api/chatbot_endpoints.dart';
import 'package:retrofit/http.dart';

part 'chatbot_service.g.dart';

@RestApi(baseUrl: ChatBotEndPoints.chatBotBaseUrl)
abstract class ChatBotService {
  factory ChatBotService(Dio dio, {String baseUrl}) = _ChatBotService;

  @POST(ChatBotEndPoints.predict)
  Future<ChatBotResponse> predictMessages(
      @Body() ChatBotBody chatBotBody
  );

}