import 'package:flutter/material.dart';

class ChatDetailScreen extends StatelessWidget {
  final String name;

  ChatDetailScreen({required this.name});

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
          IconButton(onPressed: () {}, icon: Icon(Icons.video_call)),
        ],
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                MessageBubble(text: "xin chào!", isMe: true),
                MessageBubble(text: "Xin chào!", isMe: false),
                MessageBubble(text: "Khóa học...", isMe: true),
                MessageBubble(
                  text: "Alo",
                  isMe: false,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Message",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.mic, color: Colors.blue),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: () {
                    // Handle message sending
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;

  const MessageBubble({required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: isMe ? Colors.green : Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isMe ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
