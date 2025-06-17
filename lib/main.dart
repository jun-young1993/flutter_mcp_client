// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common/constants/juny_constants.dart';
import 'package:flutter_common/network/dio_client.dart';
import 'package:flutter_common/providers/common_provider.dart';
import 'package:flutter_common/repositories/llm_client_repository.dart';
import 'package:flutter_common/state/chat/chat_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_mcp_client/ui/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  final prefs = await SharedPreferences.getInstance();

  runApp(
    CommonProvider(
      dioClient: DioClient(),
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: child,
    );
  }
}
