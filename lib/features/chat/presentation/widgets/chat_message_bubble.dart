import 'package:ai_chat_bot/features/chat/domain/entities/message_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatMessageBubble extends StatelessWidget {
  final MessageEntity message;

  const ChatMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.role == 'user';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
      child:
          Column(
            crossAxisAlignment: isUser
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: isUser
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isUser) _buildBotAvatar(),
                  const SizedBox(width: 12),
                  _buildMessageContainer(isUser),
                ],
              ),
              const SizedBox(height: 6),
              _buildMessageLabel(isUser),
            ],
          ).animate().shimmer(
            duration: const Duration(milliseconds: 800),
            color: Colors.white.withValues(alpha: 0.2),
            blendMode: BlendMode.srcATop,
          ),
    ).animate().fadeIn();
  }

  Widget _buildBotAvatar() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF1E6AFB).withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.smart_toy_rounded,
        color: Color(0xFF1E6AFB),
        size: 20.sp,
      ),
    );
  }

  Widget _buildMessageContainer(bool isUser) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: isUser ? const Color(0xFF1E6AFB) : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(24),
            topRight: const Radius.circular(24),
            bottomLeft: Radius.circular(isUser ? 24 : 0),
            bottomRight: Radius.circular(isUser ? 0 : 24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black87,
            fontSize: 16.sp,
            height: 1.4.h,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageLabel(bool isUser) {
    return Padding(
      padding: EdgeInsets.only(left: isUser ? 0 : 52, right: isUser ? 8 : 0),
      child: Text(
        isUser ? 'YOU • 2M AGO' : 'AI ASSISTANT • JUST NOW',
        style: TextStyle(
          fontSize: 11.sp,
          color: Colors.black38,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
