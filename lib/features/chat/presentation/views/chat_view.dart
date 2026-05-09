import 'package:ai_chat_bot/core/di/dependency_injection.dart';
import 'package:ai_chat_bot/features/chat/domain/repos/gemini_send_messages_repo.dart';
import 'package:ai_chat_bot/features/chat/presentation/cubit/gemini_send_messages_cubit.dart';
import 'package:ai_chat_bot/features/chat/presentation/widgets/chat_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GeminiSendMessagesCubit(getIt<GeminiSendMessagesRepo>()),
      child: const Scaffold(
        backgroundColor: Color(0xFFF7F8F9),
        body: ChatViewBody(),
      ),
    );
  }
}
