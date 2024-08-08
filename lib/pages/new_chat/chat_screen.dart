import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:dart_openai/dart_openai.dart';
import "./api_keys.dart";

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

Future<void> test() async {
  OpenAI.apiKey = CHATGPT_APIKEY;
  OpenAI.requestsTimeOut = Duration(seconds: 10);
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    test();
  }

  // the system message that will be sent to the request.
  final systemMessage = OpenAIChatCompletionChoiceMessageModel(
    content: [
      OpenAIChatCompletionChoiceMessageContentItemModel.text(
        "return any message you are given as JSON.",
      ),
    ],
    role: OpenAIChatMessageRole.assistant,
  );

  ChatUser currentUser = ChatUser(
    id: '1',
    firstName: 'Charles',
    lastName: 'Leclerc',
  );

  ChatUser chatGPTUser = ChatUser(
    id: '2',
    firstName: 'AI',
    lastName: 'Counselor',
  );

  List<ChatMessage> messages = <ChatMessage>[];
  List<ChatUser> typingUsers = <ChatUser>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        leading: Icon(Icons.person),
        title: Text("AI Counselor"),
      ),
      body: DashChat(
        typingUsers: typingUsers,
        currentUser: currentUser,
        onSend: (ChatMessage m) {
          getChatResponse(m);
        },
        messages: messages,
      ),
    );
  }

  Future<void> getChatResponse(ChatMessage m) async {
    setState(() {
      messages.insert(0, m);
      typingUsers.add(chatGPTUser);
    });

    final userMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(m.text),
      ],
      role: OpenAIChatMessageRole.user,
    );

    // all messages to be sent.
    final requestMessages = [
      systemMessage,
      userMessage,
    ];

    // the actual request.
    OpenAIChatCompletionModel chatCompletion = await OpenAI.instance.chat.create(
      model: "gpt-4o-mini",
      responseFormat: {"type": "json_object"},
      seed: 6,
      messages: requestMessages,
      temperature: 0.2,
      maxTokens: 200,
    );

    setState(() {
      messages.insert(0, ChatMessage(user: chatGPTUser, createdAt: DateTime.now(), text: chatCompletion.choices.first.message.toString()));
      typingUsers.remove(chatGPTUser);
    });
  }
}
