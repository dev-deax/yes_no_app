import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    final outlinedBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(color: Colors.transparent),
    );
    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
      enabledBorder: outlinedBorder,
      focusedBorder: outlinedBorder,
      filled: true,
      suffixIcon: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.send_outlined),
      ),
    );
    return TextFormField(
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('submitted $value');
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
