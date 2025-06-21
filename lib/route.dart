import 'package:flutter/material.dart';
import 'package:flutter_common/app_navigation.dart';
import 'package:flutter_common/widgets/fade_route.dart';
import 'package:flutter_common/widgets/layout/mcp_config_screen_layout.dart';
import 'package:flutter_mcp_client/ui/screen/ai_chat_screen.dart';
import 'package:flutter_mcp_client/ui/screen/setting_screen.dart';

enum AppRoutes { chat, aiSetting }

class AppPaths implements IPath<AppRoutes> {
  static const chat = '/chat';
  static const aiSetting = '/mcp-config';
  static const _path = {AppRoutes.chat: chat, AppRoutes.aiSetting: aiSetting};

  @override
  String of(AppRoutes route) => _path[route] ?? '';

  FadeRoute onGenerateRoute(RouteSettings settings) {
    if (settings.name == null) {
      throw Exception('Route name is null');
    }

    switch (settings.name) {
      case AppPaths.chat:
        return FadeRoute(page: const AIChatScreen());
      case AppPaths.aiSetting:
        return FadeRoute(page: const McpConfigScreenLayout());
      default:
        return FadeRoute(page: const AIChatScreen());
    }
  }
}
