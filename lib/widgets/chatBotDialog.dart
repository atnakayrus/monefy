import 'package:flutter/material.dart';
import 'package:monefy/constants/appstyle.dart';

class ChatBotDialog extends StatefulWidget {
  const ChatBotDialog({super.key});

  @override
  State<ChatBotDialog> createState() => _ChatBotDialogState();
}

TextEditingController input = TextEditingController();

class _ChatBotDialogState extends State<ChatBotDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          "ChatBot AI",
          style: TextStyle(color: AppStyle.mainOff),
        ),
      ),
      content: Container(
        height: 400,
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.up,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: input,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Write a message',
                    ),
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.send))
              ],
            ),
            Container(
                color: AppStyle.accentOff,
                padding: EdgeInsets.all(10),
                child: Text(
                  "This is a sample text",
                  style: TextStyle(fontSize: 14),
                ))
          ],
          // ),
        ),
      ),
    );
  }
}
