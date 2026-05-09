import 'package:ai_chat_bot/features/chat/domain/entities/message_entity.dart';
import 'package:ai_chat_bot/features/chat/presentation/widgets/chat_message_bubble.dart';
import 'package:ai_chat_bot/features/chat/presentation/widgets/typing_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatMessagesList extends StatelessWidget {
  final List<MessageEntity> messages;
  final bool isLoading;

  const ChatMessagesList({
    super.key,
    required this.messages,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 20.sp),
      itemCount: isLoading ? messages.length + 1 : messages.length,
      itemBuilder: (context, index) {
        if (isLoading && index == messages.length) {
          return const TypingIndicator();
        }
        return ChatMessageBubble(message: messages[index]);
      },
    );
  }
}
