import 'package:ai_chat_bot/features/chat/domain/entities/message_entity.dart';
import 'package:ai_chat_bot/features/chat/presentation/widgets/chat_header.dart';
import 'package:ai_chat_bot/features/chat/presentation/widgets/chat_input_bar.dart';
import 'package:ai_chat_bot/features/chat/presentation/widgets/chat_messages_list_bloc_consumer.dart';
import 'package:flutter/material.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key});

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  // Mock data for UI demonstration as requested

  // final List<MessageEntity> mockMessages = [
  //   const MessageEntity(
  //     role: 'model',
  //     text: "Hello, I'm your AI assistant for today !",
  //   ),
  //   const MessageEntity(
  //     role: 'user',
  //     text: "Hey, I'm Sherif and I'm working as Flutter Developer.",
  //   ),
  // ];

  final List<MessageEntity> messages = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ChatHeader(),
        Expanded(child: ChatMessagesListBlocConsumer(messages: messages)),
        ChatInputBar(messages: messages),
      ],
    );
  }
}
