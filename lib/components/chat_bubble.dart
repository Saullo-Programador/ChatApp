import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUserMessage;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUserMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isCurrentUserMessage ? Colors.purple : Colors.grey.shade500,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          bottomLeft: isCurrentUserMessage ? Radius.circular(12) : Radius.zero,
          bottomRight: isCurrentUserMessage ? Radius.zero : Radius.circular(12),
        ),
      ),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.75, // Ocupa no máximo 75% da largura da tela
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
      child: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
