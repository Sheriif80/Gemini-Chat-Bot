import 'package:dartz/dartz.dart';
import 'package:ai_chat_bot/core/errors/failure.dart';
import 'package:ai_chat_bot/features/chat/domain/entities/message_entity.dart';

abstract class GeminiSendMessagesRepo {
  Future<Either<Failure, MessageEntity>> sendMessage(
    List<MessageEntity> messages,
  );
}
