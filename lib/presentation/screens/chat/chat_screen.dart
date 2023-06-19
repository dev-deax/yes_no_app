import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat/chat_provider.dart';
import 'package:yes_no_app/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/3135/3135768.png'),
          ),
        ),
        title: const Text("Hola"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: ChatView(),
      ),
    );
  }
}

class ChatView extends StatelessWidget {
  const ChatView({
    Key? key,
  }) : super(key: key);

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
                itemBuilder: (BuildContext context, int index) {
                  final Message message = chatProvider.messageList[index];

                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(
                          message: message,
                        )
                      : MyMessageBubble(
                          message: message.text,
                        );
                },
              ),
            ),
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
