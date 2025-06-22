import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common/app_navigation.dart';
import 'package:flutter_common/common_il8n.dart';
import 'package:flutter_common/constants/index.dart';
import 'package:flutter_common/state/app/app_bloc.dart';
import 'package:flutter_common/state/app_config/app_config_bloc.dart';
import 'package:flutter_common/state/user/user_bloc.dart';
import 'package:flutter_common/state/user/user_event.dart';
import 'package:flutter_common/widgets/app/app_screen.dart';
import 'package:flutter_common/widgets/layout/setting_screen_layout.dart';
import 'package:flutter_common/widgets/layout/notice_screen_layout.dart';
import 'package:flutter_common/widgets/lib/container/card_container.dart';
import 'package:flutter_common/widgets/lib/container/card_container_item.dart';
import 'package:flutter_mcp_client/route.dart';
import 'package:flutter_mcp_client/ui/screen/ai_chat_screen.dart';
import 'package:flutter_mcp_client/ui/screen/setting_screen.dart';

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
        SettingScreenLayout(
          topChildren: [
            CardContainer(
              title: Tr.mcp.setting.tr(),
              icon: Icons.api,
              actionIcon: Icons.edit,
              onAction: () {
                AppNavigator.I.push(AppRoutes.aiSetting);
              },
            ),
          ],
          appKey: AppKeys.caughtSmoking,
        ),
      ],
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: Tr.chat.title.tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.forum),
          label: Tr.app.community.tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: Tr.app.settings.tr(),
        ),
      ],
      bloc: appBloc,
    );
  }
}
