import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/dtos/message.dart';
import '../../providers/chats/chat_provider.dart';
import '../../widgets/chat/message_bubble.dart';
import '../../widgets/shared/message_field_box.dart';
import '../../widgets/herBar/her_presentation.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HerPresentation(
        nombre: 'Mon amour',
        urlAvatar:
            'https://hips.hearstapps.com/hmg-prod/images/actress-emma-watson-attends-the-beauty-and-the-beast-new-news-photo-1644853447.jpg?crop=0.668xw:1.00xh;0.189xw,0&resize=1200:*',
      ),
      body: ChatView(),
    );
  }
}

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(
                          message: message.text, urlGif: message.imageUrl)
                      : MyMessageBubble(message: message.text);
                },
              ),
            ),
            MessageFieldBox(onValue: chatProvider.sendMessage),
          ],
        ),
      ),
    );
  }
}
