import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:dash_chat_2/dash_chat_2.dart";
import "package:flutter/material.dart";
import "./api_keys.dart";
import 'package:dart_openai/dart_openai.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Future<void> setup() async {
    OpenAI.apiKey = CHATGPT_APIKEY;
    OpenAI.requestsTimeOut = const Duration(seconds: 5);
    messages = await readUserMessage();
  }
  // need to re run the read messages every time the chat page is shown so can't put it in init
  // we also need to fix the function so it runs over the AI chats as well, can't really test it tho

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setup();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  ChatUser user = ChatUser(
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

  // the system message that will be sent to the request.
  final systemMessage = OpenAIChatCompletionChoiceMessageModel(
    content: [
      OpenAIChatCompletionChoiceMessageContentItemModel.text(
        "return any message you are given as JSON.",
      ),
    ],
    role: OpenAIChatMessageRole.assistant,
  );

  List<ChatUser> typingUsers = <ChatUser>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.person),
        backgroundColor: Colors.green,
        title: Text("AI Counselor"),
      ),
      body: DashChat(
        typingUsers: typingUsers,
        currentUser: user,
        onSend: (ChatMessage m) {
          sendMessage(m);
          //addUserMessage(m.text);
          //getChatMessage(m);
        },
        messages: messages,
      ),
    );
  }

  Future<void> getChatMessage(ChatMessage m) async {
    setState(() {
      messages.insert(0, m);
      typingUsers.add(chatGPTUser);
    });

    // the user message that will be sent to the request.
    final userMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          m.text,
        ),
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
      model: "gpt-3.5-turbo-1106",
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

  Future<void> sendMessage(ChatMessage m) async {
    if (await checkIfUserMessagesExists() == false) {
      createUserMessage();
    }
    addUserMessage(m.text);
    //getChatMessage(m);
  }

  Future<bool> checkIfUserMessagesExists() async {
    try {
      var collectionRef = FirebaseFirestore.instance.collection('users_ai_chat');
      var doc = await collectionRef.doc(auth.currentUser?.uid).get();

      return doc.exists;
    } catch (e) {
      throw e;
    }
  }

  Future<void> createUserMessage() async {
    final userDocument = FirebaseFirestore.instance.collection("users_ai_chat").doc(auth.currentUser?.uid);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      await transaction.set(userDocument, {"user": {}});
    }).then(
      (value) => print("DocumentSnapshot successfully updated!"),
      onError: (e) => print("Error updating document $e"),
    );
  }

  Future<List<ChatMessage>> readUserMessage() async {
    List<ChatMessage> allOurMessages = [];
    if (await checkIfUserMessagesExists() == false) {
      return allOurMessages;
    }
    final userMessages = FirebaseFirestore.instance.collection('users_ai_chat').doc(auth.currentUser?.uid);
    Map<String, dynamic> messagesFromUser = {};
    await userMessages.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        messagesFromUser = data["user"];
      },
      onError: (e) => print("Error getting document: $e"),
    );

    messagesFromUser.forEach((k, v) {
      ChatMessage temp = ChatMessage(user: user, createdAt: DateTime.parse(k), text: v);
      ;
      allOurMessages.add(temp);
    });

    return allOurMessages;
  }

  Future<void> addUserMessage(String message) async {
    final userMessages = FirebaseFirestore.instance.collection('users_ai_chat').doc(auth.currentUser?.uid);
    Map<String, dynamic> messagesFromUser = {};

    await userMessages.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        messagesFromUser = data["user"];
      },
      onError: (e) => print("Error getting document: $e"),
    );

    messagesFromUser[DateTime.now().toString()] = message;

    return userMessages
        .update({"user": messagesFromUser})
        .then((value) => print("Message added successfully!"))
        .catchError((error) => print("Failed to add message: $error"));
  }
}
