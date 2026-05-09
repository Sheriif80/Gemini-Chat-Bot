import 'package:ai_chat_bot/features/chat/domain/entities/message_entity.dart';
import 'package:ai_chat_bot/features/chat/presentation/cubit/gemini_send_messages_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FailureMessageBubble extends StatelessWidget {
  final String errorMessage;
  final List<MessageEntity> messages;

  const FailureMessageBubble({
    super.key,
    required this.errorMessage,
    required this.messages,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              errorMessage,
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: 8.w),
          TextButton.icon(
            onPressed: () {
              context.read<GeminiSendMessagesCubit>().sendMessage(messages);
            },
            icon: Icon(
              Icons.refresh_rounded,
              size: 16.sp,
              color: const Color(0xFF1E6AFB),
            ),
            label: Text(
              'Retry',
              style: TextStyle(
                color: const Color(0xFF1E6AFB),
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    ).animate().fadeIn();
  }
}
