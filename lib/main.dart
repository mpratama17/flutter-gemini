// import 'package:berl1n_gemini/home.dart';
// import 'package:berl1n_gemini/pages/chat.dart';
// import 'package:berl1n_gemini/pages/chat.dart';
import 'package:berl1n_gemini/pages/home.dart';
// import 'package:berl1n_gemini/pages/home.dart';
import 'package:flutter/material.dart';

const apiKey = "AIzaSyAjurCZ9_suX9XLMriM_XlZmI_ZuyJGtwk";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}
