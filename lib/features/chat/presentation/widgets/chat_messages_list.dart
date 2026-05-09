import 'package:ai_chat_bot/features/chat/domain/entities/message_entity.dart';
import 'package:ai_chat_bot/features/chat/presentation/widgets/chat_message_bubble.dart';
import 'package:ai_chat_bot/features/chat/presentation/widgets/failure_message_bubble.dart';
import 'package:ai_chat_bot/features/chat/presentation/widgets/typing_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatMessagesList extends StatelessWidget {
  final List<MessageEntity> messages;

  const ChatMessagesList({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 20.sp),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return ChatMessageBubble(message: messages[index]);
      },
    );
  }
}

class LoadingChatMessagesList extends StatelessWidget {
  final List<MessageEntity> messages;

  const LoadingChatMessagesList({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 20.sp),
      itemCount: messages.length + 1,
      itemBuilder: (context, index) {
        if (index == messages.length) {
          return const TypingIndicator();
        }
        return ChatMessageBubble(message: messages[index]);
      },
    );
  }
}

class ErrorChatMessagesList extends StatelessWidget {
  final List<MessageEntity> messages;
  final String errorMessage;

  const ErrorChatMessagesList({
    super.key,
    required this.messages,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 20.sp),
      itemCount: messages.length + 1,
      itemBuilder: (context, index) {
        if (index == messages.length) {
          return FailureMessageBubble(
            errorMessage: errorMessage,
            messages: messages,
          );
        }
        return ChatMessageBubble(message: messages[index]);
      },
    );
  }
}
