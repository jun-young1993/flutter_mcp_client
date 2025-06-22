// import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/app_navigation.dart';
import 'package:flutter_common/constants/juny_constants.dart';
import 'package:flutter_common/network/dio_client.dart';
import 'package:flutter_common/providers/common_provider.dart';
import 'package:flutter_common/widgets/ad/ad_manager.dart';
import 'package:flutter_mcp_client/route.dart';

import 'package:flutter_mcp_client/ui/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AdManager().initialize();
  await EasyLocalization.ensureInitialized();
  AdManager.setRealAdUnitIds({
    'android': {'banner': ''},
    'ios': {'banner': 'ca-app-pub-4656262305566191/7656024890'},
  });

  final prefs = await SharedPreferences.getInstance();

  final apiUrl = JunyConstants.apiBaseUrl;

  AppNavigator.init<AppRoutes, AppPaths>(
    onGenerateRoute: AppPaths().onGenerateRoute,
    pathProvider: AppPaths(),
  );
  runApp(
    CommonProvider(
      dioClient: DioClient(baseUrl: apiUrl, useLogInterceptor: false),
      appKey: AppKeys.caughtSmoking,
      sharedPreferences: prefs,
      child: MyApp(child: MainScreen()),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Widget child;
  const MyApp({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Tool Assistant',
      navigatorKey: AppNavigator.I.navigatorKey,
      onGenerateRoute: AppNavigator.I.onGenerateRoute,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: child,
    );
  }
}
