import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ai_chat_bot/core/networking/api_service.dart';
import 'package:ai_chat_bot/features/chat/data/models/gemini_models.dart';

class GeminiChatService {
  final ApiService _apiService;

  // TODO: Move this to an environment variable (.env) for security
  final String _apiKey = dotenv.get('GEMINI_API_KEY');

  final String _baseUrl =
      'https://generativelanguage.googleapis.com/v1beta/models';

  // You can change this to 'gemini-3-flash-preview' depending on your needs
  final String _model = 'gemini-2.5-flash';

  GeminiChatService(this._apiService);

  Future<GeminiResponse> sendMessage(GeminiRequest request) async {
    try {
      final response = await _apiService.post(
        '$_baseUrl/$_model:generateContent',
        options: Options(
          headers: {
            'x-goog-api-key': _apiKey,
            'Content-Type': 'application/json',
          },
        ),
        data: request.toJson(),
      );

      return GeminiResponse.fromJson(response.data);
    } catch (e) {
      // Depending on your error handling strategy, you might want to log this
      // or map it to a domain-specific exception.
      rethrow;
    }
  }
}
