import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatInputBar extends StatefulWidget {
  final Function(String) onSend;

  const ChatInputBar({super.key, required this.onSend});

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void _handleSend() {
    if (_controller.text.trim().isNotEmpty) {
      widget.onSend(_controller.text.trim());
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.sp, 12.sp, 20.sp, 30.sp),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F9),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.black.withValues(alpha: 0.05)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildIconButton(Icons.attachment_rounded),
            Expanded(child: _buildTextField()),
            _buildIconButton(Icons.mic_none_rounded),
            const SizedBox(width: 4),
            _buildSendButton(),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return IconButton(
      icon: Icon(icon, color: Colors.black38, size: 24),
      onPressed: () {},
    );
  }

  Widget _buildTextField() {
    return TextField(
      controller: _controller,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      style: TextStyle(fontSize: 16.sp),
      decoration: InputDecoration(
        hintText: 'Describe what you need...',
        hintStyle: TextStyle(color: Colors.black26, fontSize: 16.sp),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.sp),
      ),
      onSubmitted: (_) => _handleSend(),
    );
  }

  Widget _buildSendButton() {
    return GestureDetector(
      onTap: _handleSend,
      child: Container(
        padding: EdgeInsets.all(12.sp),
        decoration: const BoxDecoration(
          color: Color(0xFF1E6AFB),
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.send_rounded, color: Colors.white, size: 22.sp),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
