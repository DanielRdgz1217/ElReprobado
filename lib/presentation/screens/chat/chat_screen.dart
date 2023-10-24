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
        nombre: 'Madonna',
        urlAvatar:
            'https://www.tn23.tv/wp-content/uploads/2023/07/Madonna-agradece-a-su-familia-el-apoyo-durante-su-enfermedad--256x256.jpg',
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