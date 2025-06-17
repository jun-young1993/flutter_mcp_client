import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common/state/chat/chat_bloc.dart';
import 'package:flutter_common/state/chat/chat_event.dart';
import 'package:flutter_common/state/chat/chat_selector.dart';
import 'package:flutter_common/widgets/layout/chat_screen.dart';

class AIChatScreen extends StatefulWidget {
  const AIChatScreen({super.key});

  @override
  State<AIChatScreen> createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
  ChatBloc get chatBloc => context.read<ChatBloc>();
  @override
  Widget build(BuildContext context) {
    return ChatMessagesSelector((messages) {
      return ChatScreen(
        messages: messages,
        onSendMessage: (message) {
          chatBloc.add(ChatEvent.sendMessage(message));
        },
      );
    });
  }
}
