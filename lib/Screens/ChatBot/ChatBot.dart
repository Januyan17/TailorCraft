// ignore_for_file: use_key_in_widget_constructors

import 'dart:convert';

import 'package:flutter/material.dart';

import '../../API/api.dart';

class ChatBotScreen extends StatefulWidget {
  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  TextEditingController chatController = TextEditingController();

  var sinhalaTranslatedText;

  final List<Map<String, dynamic>> _messages = [
    {'text': 'Hello! How can I help you?', 'isUserMessage': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatBot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessage(message['text'], message['isUserMessage']);
              },
            ),
          ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildMessage(String text, bool isUserMessage) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      color: isUserMessage ? Colors.blue : Colors.grey[300],
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          sinhalaTranslatedText.toString() ?? "",
          style: TextStyle(
            color: isUserMessage ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: chatController,
              decoration: InputDecoration(
                hintText: 'Type your message...',
                border: OutlineInputBorder(),
              ),
              // Handle sending the message
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              translation();
              // Implement sending the message
            },
          ),
        ],
      ),
    );
  }

  void translation() async {
    try {
      var data = {
        "text": chatController.text,
      };

      print(" sending dataaaa");
      print(data);
      print(" sending dataaaa");
      var res = await CallApi().postData(data, 'translate/english-to-sinhala');
      var body = json.decode(res.body);
      setState(() {
        sinhalaTranslatedText = body["translation"];
      });

      print(body['translation']);
    } catch (e) {}
  }
}
