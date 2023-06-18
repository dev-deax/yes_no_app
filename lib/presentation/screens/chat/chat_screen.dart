import 'package:flutter/material.dart';
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
      ),
      body: const _chatView(),
    );
  }
}

class _chatView extends StatelessWidget {
  const _chatView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 120,
                itemBuilder: (BuildContext context, int index) {
                  return (index % 2 == 0)
                      ? const HerMessageBubble()
                      : const MyMessageBubble();
                },
              ),
            ),
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
