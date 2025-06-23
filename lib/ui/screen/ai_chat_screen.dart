import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common/app_navigation.dart';
import 'package:flutter_common/state/mcp_chat/mcp_chat_bloc.dart';
import 'package:flutter_common/state/mcp_chat/mcp_chat_event.dart';
import 'package:flutter_common/state/mcp_chat/mcp_chat_selector.dart';
import 'package:flutter_common/state/mcp_config/mcp_config_bloc.dart';
import 'package:flutter_common/state/mcp_config/mcp_config_event.dart';
import 'package:flutter_common/widgets/layout/mcp_chat_screen_layout.dart';
import 'package:flutter_mcp_client/route.dart';

class AIChatScreen extends StatefulWidget {
  const AIChatScreen({super.key});

  @override
  State<AIChatScreen> createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
  McpChatBloc get chatBloc => context.read<McpChatBloc>();
  McpConfigBloc get configBloc => context.read<McpConfigBloc>();

  @override
  void initState() {
    super.initState();
    configBloc.add(const McpConfigEvent.initialize());
  }

  @override
  Widget build(BuildContext context) {
    return McpChatMessagesSelector((messages) {
      debugPrint('messages: $messages');
      return McpChatScreenLayout(
        settingIcon: Icons.api,
        onSettingsPressed: () => AppNavigator.I.push(AppRoutes.aiSetting),
        messages: messages,
        onSendMessage: (message) {
          // chatBloc.add(McpChatEvent.sendMessage(message));
          chatBloc.add(McpChatEvent.streamMessage(message));
        },
      );
    });
  }
}
