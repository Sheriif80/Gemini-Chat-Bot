import 'package:ai_chat_bot/features/chat/domain/entities/message_entity.dart';
import 'package:ai_chat_bot/features/chat/presentation/cubit/gemini_send_messages_cubit.dart';
import 'package:ai_chat_bot/features/chat/presentation/widgets/chat_messages_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatMessagesListBlocConsumer extends StatelessWidget {
  const ChatMessagesListBlocConsumer({super.key, required this.messages});

  final List<MessageEntity> messages;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeminiSendMessagesCubit, GeminiSendMessagesState>(
      listener: (context, state) {
        if (state is GeminiSendMessagesSuccess) {
          messages.add(state.message);
        }
        if (state is GeminiSendMessagesError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return ChatMessagesList(messages: messages);
      },
    );
  }
}
