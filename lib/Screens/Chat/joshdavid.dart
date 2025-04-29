import 'package:flutter/material.dart';

class Joshdavid extends StatefulWidget {
  const Joshdavid({super.key});

  @override
  State<Joshdavid> createState() => _JoshdavidState();
}

class _JoshdavidState extends State<Joshdavid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            size: 30,
          ),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/images/img.png"),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Josh David",
              style: TextStyle(fontFamily: "PoppinsRegular", fontSize: 20),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: Icon(Icons.video_call_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Color(0xFF38515D),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '10th December 2024',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            ChatBubble(
              text:
                  'Welcome! I’m glad you’re here.\nHow have you been feeling lately?',
              isMe: false,
            ),
            ChatBubble(
              text:
                  'Welcome! I’m glad you’re here.\nHow have you been feeling lately?',
              isMe: true,
            ),
            ChatBubble(
              text:
                  'I see. Can you tell me a bit more\nabout what’s been triggering your\nanxiety?',
              isMe: false,
            ),
            ChatBubble(
              text:
                  'It happens mostly in social\nsituations. I feel like people are\njudging me, and I get nervous\nspeaking up.',
              isMe: true,
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.emoji_emotions_outlined),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Message',
                          // Keep the typo as per your image
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {},
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.mic),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;

  const ChatBubble({required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isMe ? Color(0xFF64C7DF) : Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
