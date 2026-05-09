import 'package:ai_chat_bot/features/chat/presentation/widgets/chat_view_body.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF7F8F9),
      body: ChatViewBody(),
    );
  }
}
