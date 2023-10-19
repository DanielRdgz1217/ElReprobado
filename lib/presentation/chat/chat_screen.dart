import 'package:flutter/material.dart';
import '../widgets/her_message_bubble.dart';
import '../widgets/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://hips.hearstapps.com/hmg-prod/images/actress-emma-watson-attends-the-beauty-and-the-beast-new-news-photo-1644853447.jpg?crop=0.668xw:1.00xh;0.189xw,0&resize=1200:*'),
          ),
        ),
        title: const Text('Mon amour'),
        centerTitle: false,
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return (index % 2 == 0) ? const MyMessageBubble() : const HerMessageBubble();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
