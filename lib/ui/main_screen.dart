import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common/constants/index.dart';
import 'package:flutter_common/state/app/app_bloc.dart';
import 'package:flutter_common/state/app_config/app_config_bloc.dart';
import 'package:flutter_common/state/user/user_bloc.dart';
import 'package:flutter_common/state/user/user_event.dart';
import 'package:flutter_common/widgets/app/app_screen.dart';
import 'package:flutter_common/widgets/layout/setting_screen_layout.dart';
import 'package:flutter_common/widgets/layout/notice_screen_layout.dart';
import 'package:flutter_mcp_client/ui/screen/ai_chat_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  AppBloc get appBloc => context.read<AppBloc>();
  AppConfigBloc get appConfigBloc => context.read<AppConfigBloc>();
  UserBloc get userBloc => context.read<UserBloc>();
  @override
  void initState() {
    super.initState();
    userBloc.add(const UserEvent.initialize());
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      screens: [
        AIChatScreen(),
        NoticeScreenLayout(groupName: 'parking-zone-code-02782'),
        SettingScreenLayout(appKey: AppKeys.caughtSmoking),
      ],
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: '채팅'),
        BottomNavigationBarItem(icon: Icon(Icons.forum), label: '커뮤니티'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정'),
      ],
      bloc: appBloc,
    );
  }
}
