import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messages = [
    Message(text: 'Hola', from: FromWho.me),
    Message(text: 'Que haces?', from: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    
  }
}
