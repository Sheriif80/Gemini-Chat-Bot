import 'package:dartz/dartz.dart';
import 'package:ai_chat_bot/core/errors/failure.dart';
import 'package:ai_chat_bot/core/networking/api_error_handler.dart';
import 'package:ai_chat_bot/features/chat/data/models/gemini_models.dart';
import 'package:ai_chat_bot/features/chat/data/services/gemini_chat_service.dart';
import 'package:ai_chat_bot/features/chat/domain/entities/message_entity.dart';
import 'package:ai_chat_bot/features/chat/domain/repos/gemini_send_messages_repo.dart';

class GeminiSendMessagesRepoImpl implements GeminiSendMessagesRepo {
  final GeminiChatService _chatService;

  GeminiSendMessagesRepoImpl(this._chatService);

  @override
  Future<Either<Failure, MessageEntity>> sendMessage(
    List<MessageEntity> messages,
  ) async {
    try {
      final requestModels = messages
          .map((e) => MessageModel.fromEntity(e))
          .toList();
      final request = GeminiRequest(contents: requestModels);

      final response = await _chatService.sendMessage(request);

      if (response.candidates.isNotEmpty) {
        return Right(response.candidates.first.content.toEntity());
      } else {
        return const Left(ServerFailure('No response received from Gemini.'));
      }
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
