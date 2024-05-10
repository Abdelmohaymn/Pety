class ChatBotBody {
  ChatBotBody({
      this.messages,});

  ChatBotBody.fromJson(dynamic json) {
    messages = json['messages'] != null ? json['messages'].cast<String>() : [];
  }
  List<String>? messages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['messages'] = messages;
    return map;
  }

}