
class ChatResponse {
  final String id;
  final String provider;
  final String model;
  final String object;
  final int created;
  final List<Choice> choices;
  final Usage usage;

  ChatResponse({
    required this.id,
    required this.provider,
    required this.model,
    required this.object,
    required this.created,
    required this.choices,
    required this.usage,
  });

  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    return ChatResponse(
      id: json['id'],
      provider: json['provider'],
      model: json['model'],
      object: json['object'],
      created: json['created'],
      choices: List<Choice>.from(json['choices'].map((x) => Choice.fromJson(x))),
      usage: Usage.fromJson(json['usage']),
    );
  }
}

class Choice {
  final String? finishReason;
  final String? nativeFinishReason;
  final int index;
  final Message message;

  Choice({
    this.finishReason,
    this.nativeFinishReason,
    required this.index,
    required this.message,
  });

  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
      finishReason: json['finish_reason'],
      nativeFinishReason: json['native_finish_reason'],
      index: json['index'],
      message: Message.fromJson(json['message']),
    );
  }
}

class Message {
  final String role;
  final String content;

  Message({
    required this.role,
    required this.content,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      role: json['role'],
      content: json['content'],
    );
  }
}

class Usage {
  final int promptTokens;
  final int completionTokens;
  final int totalTokens;

  Usage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  factory Usage.fromJson(Map<String, dynamic> json) {
    return Usage(
      promptTokens: json['prompt_tokens'],
      completionTokens: json['completion_tokens'],
      totalTokens: json['total_tokens'],
    );
  }
}

