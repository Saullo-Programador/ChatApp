import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.purple : Colors.grey.shade500,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          bottomLeft: isCurrentUser ? Radius.circular(12) : Radius.zero,
          bottomRight: isCurrentUser ? Radius.zero : Radius.circular(12),
        ),
      ),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.75, // Ocupa no máximo 75% da largura da tela
      ),
      padding: const EdgeInsets.all(13),
      margin: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 20),
      child: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
