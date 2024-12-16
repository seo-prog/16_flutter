import 'package:chap04_stateful_widget/statefiul/01_problem.dart';
import 'package:chap04_stateful_widget/statefiul/02_state_ful.dart';
import 'package:chap04_stateful_widget/statefiul/03_question.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Stateful Widget"),
        ),
      ),
      body: Button(),
    );
  }
}

