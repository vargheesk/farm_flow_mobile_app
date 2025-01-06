import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final Gemini gemini = Gemini.instance;

  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "Folium",
    profileImage:
        "https://i0.wp.com/arktimes.com/wp-content/uploads/2019/04/2247958-movie_review1-1.jpg?fit=600%2C570&ssl=1",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text("Chatbot"),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return DashChat(
      inputOptions: const InputOptions(),
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });

    ChatMessage responseMessage = ChatMessage(
      user: geminiUser,
      createdAt: DateTime.now(),
      text: '',
    );

    setState(() {
      messages = [responseMessage, ...messages];
    });

    StringBuffer fullResponse = StringBuffer();

    gemini.promptStream(
      parts: [
        Part.text(
            " Act as a chatbot named Folium, the official chatbot of the FarmFlow app. Your purpose is to assist users with agriculture-related queries by providing accurate and helpful information ," +
                chatMessage.text)
      ],
    ).listen((event) {
      fullResponse.write(event?.output ?? '');

      setState(() {
        messages[0] = ChatMessage(
          user: geminiUser,
          createdAt: responseMessage.createdAt,
          text: fullResponse.toString(),
        );
      });
    }).onError((error) {
      setState(() {
        messages[0] = ChatMessage(
          user: geminiUser,
          createdAt: responseMessage.createdAt,
          text: 'An error occurred: $error',
        );
      });
    });
  }
}
