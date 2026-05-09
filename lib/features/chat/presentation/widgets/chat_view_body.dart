import 'package:ai_chat_bot/features/chat/domain/entities/message_entity.dart';
import 'package:ai_chat_bot/features/chat/presentation/widgets/chat_header.dart';
import 'package:ai_chat_bot/features/chat/presentation/widgets/chat_input_bar.dart';
import 'package:ai_chat_bot/features/chat/presentation/widgets/chat_messages_list.dart';
import 'package:flutter/material.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for UI demonstration as requested
    final List<MessageEntity> mockMessages = [
      const MessageEntity(
        role: 'model',
        text: "Hello, I'm your AI assistant for today !",
      ),
      const MessageEntity(
        role: 'user',
        text: "Hey, I'm Sherif and I'm working as Flutter Developer.",
      ),
    ];
    return Column(
      children: [
        const ChatHeader(),
        Expanded(child: ChatMessagesList(messages: mockMessages)),
        ChatInputBar(
          onSend: (text) {
            // Logic will be handled by the user
          },
        ),
      ],
    );
  }
}
