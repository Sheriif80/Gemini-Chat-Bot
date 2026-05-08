class GeminiRequest {
  final List<MessageModel> contents;

  GeminiRequest({required this.contents});

  Map<String, dynamic> toJson() {
    return {'contents': contents.map((e) => e.toJson()).toList()};
  }
}

class GeminiResponse {
  final List<CandidateModel> candidates;

  GeminiResponse({required this.candidates});

  factory GeminiResponse.fromJson(Map<String, dynamic> json) {
    return GeminiResponse(
      candidates:
          (json['candidates'] as List<dynamic>?)
              ?.map((e) => CandidateModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

class CandidateModel {
  final MessageModel content;
  final String? finishReason;
  final int? index;

  CandidateModel({required this.content, this.finishReason, this.index});

  factory CandidateModel.fromJson(Map<String, dynamic> json) {
    return CandidateModel(
      content: MessageModel.fromJson(json['content'] as Map<String, dynamic>),
      finishReason: json['finishReason'] as String?,
      index: json['index'] as int?,
    );
  }
}

/// Shared model for both Request and Response
class MessageModel {
  final String role;
  final List<MessagePart> parts;

  MessageModel({required this.role, required this.parts});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      role: json['role'] as String? ?? '',
      parts:
          (json['parts'] as List<dynamic>?)
              ?.map((e) => MessagePart.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {'role': role, 'parts': parts.map((e) => e.toJson()).toList()};
  }
}

class MessagePart {
  final String text;

  MessagePart({required this.text});

  factory MessagePart.fromJson(Map<String, dynamic> json) {
    return MessagePart(text: json['text'] as String? ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'text': text};
  }
}
