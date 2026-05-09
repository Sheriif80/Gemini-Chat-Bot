import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_chat_bot/features/chat/domain/entities/message_entity.dart';
import 'package:ai_chat_bot/features/chat/domain/repos/gemini_send_messages_repo.dart';

part 'gemini_send_messages_state.dart';

class GeminiSendMessagesCubit extends Cubit<GeminiSendMessagesState> {
  final GeminiSendMessagesRepo _repo;

  GeminiSendMessagesCubit(this._repo) : super(GeminiSendMessagesInitial());

  Future<void> sendMessage(List<MessageEntity> messages) async {
    emit(GeminiSendMessagesLoading());
    final result = await _repo.sendMessage(messages);
    result.fold(
      (failure) => emit(GeminiSendMessagesError(failure.message)),
      (message) => emit(GeminiSendMessagesSuccess(message)),
    );
  }
}
