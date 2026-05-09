part of 'gemini_send_messages_cubit.dart';

abstract class GeminiSendMessagesState {}

class GeminiSendMessagesInitial extends GeminiSendMessagesState {}

class GeminiSendMessagesLoading extends GeminiSendMessagesState {}

class GeminiSendMessagesSuccess extends GeminiSendMessagesState {
  final MessageEntity message;

  GeminiSendMessagesSuccess(this.message);
}

class GeminiSendMessagesError extends GeminiSendMessagesState {
  final String message;

  GeminiSendMessagesError(this.message);
}
