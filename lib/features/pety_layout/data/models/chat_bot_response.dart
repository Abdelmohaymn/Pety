class ChatBotResponse {
  ChatBotResponse({
      this.response,
  });

  ChatBotResponse.fromJson(dynamic json) {
    response = json['response'];
  }
  String? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response'] = response;
    return map;
  }

}