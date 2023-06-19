import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({Key? key, required this.onValue}) : super(key: key);

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
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          onValue(textController.value.text);
          textController.clear();
          focusNode.requestFocus();
        },
      ),
    );
    return TextFormField(
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
