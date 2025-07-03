import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/chat_bubble.dart';
import 'package:flutter_app/components/my_textfield.dart';
import 'package:flutter_app/service/auth/auth_service.dart';
import 'package:flutter_app/service/chat/chat_service.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiveID;

  ChatPage({super.key, required this.receiverEmail, required this.receiveID});

  final TextEditingController _messageController = TextEditingController();

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(receiveID, _messageController.text);

      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(receiverEmail)
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList()
          ),
          _buildMessageInput()
        ],
      ),
    );
  }

  Widget _buildMessageList(){
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(receiveID, senderID),
      builder: (context, snapshot) {
        if(snapshot.hasError) {
          return const Text("Error");
        }

        if(snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView(
          children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  Widget _buildMessageItem( DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUserMessage = data['senderID'] == _authService.getCurrentUser()!.uid;

    var alignment = isCurrentUserMessage ? Alignment.centerLeft : Alignment.centerRight;
    var crossAxisAlignment = isCurrentUserMessage ? CrossAxisAlignment.start : CrossAxisAlignment.end;


    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          ChatBubble(
            message: data["message"], 
            isCurrentUserMessage: isCurrentUserMessage
          )
        ],
      ),
    );
  }

  Widget _buildMessageInput(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Expanded(
            child: MyTextField(
              hintText: "Type a message",
              obscureText: false, 
              controller: _messageController
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.purple,
              shape: BoxShape.circle,
            ),
            margin: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}
