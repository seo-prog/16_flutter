import 'package:chap06_permision_handler/permission/01_contact_page.dart';
import 'package:chap06_permision_handler/permission/02_Camera_page.dart';
import 'package:chap06_permision_handler/permission/03_cameraTest.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Contact App",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("홈 화면"),
      ),
      body:
      // 전화번호 관련 권한 받기
      // ContextsPage(),

      // 카메라 관련 권한 받기
      // CameraPermissionPage(),

      // test문제
      CameraPermissionPageTest(),

    );
  }
}

