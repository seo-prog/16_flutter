/*
* firebase?
* (벡엔드를 모르고 플러터만 공부한 사람들도 사용가능 하도록 도와주는 플랫폼)
* - 구글에서 제공하는 클라우드 기반 어플리케이션 개발 플랫폼
* - 다양한 도구와 서비스를 제공하여 개발 시간을 단축하고, 효율성을 높일 수 있다.
*
* - db, 인증, 서버가 없을 시 백엔드 코드 실행 등도 제공하지만, 우리는 spring 과 mysql 을 사용하므로
* 우리는 알림만 사용해볼것..
* - 클라우드 저장소도 1GB 무료로 제공한다..
*
* Firebase Cloud Messaging (FCM)
* - 무료 푸시 알림 서비스. 사용자에게 실시간 메세지를 보낼 수 있다.
*
* */

import 'package:chap13_firebase_message/notification/init_noti.dart';
import 'package:chap13_firebase_message/notification/show_noti.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // firebase 관련 기능을 사용하기 전에 초기화 해야한다.
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}


/* chap 1 !*/

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   // 푸시 알림을 관리하기 위한 객체
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//
//   @override
//   void initState() {
//     super.initState();
//     requestNotificationPermission();
//
//     // 앱 실행 시 토큰을 가져오는 코드
//     _firebaseMessaging.getToken().then((token) {
//       print("FCM token : $token");
//
//       // 서버로 토큰 전송
//     });
//
//
//     // 포그라운드(앱이 보여지고있는 상태) 상태에서 알람을 처리하기 위한 핸들러
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print("Foreground message : ${message.notification?.title}");
//     });
//
//     // 알람을 클릭해서 맵이 열릴 때 핸들러
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print("알림을 클릭해서 입이 열리는 상태 : ${message.notification?.title}");
//     });
//
//
//     // 백그라운드 및 종료 상태에서 알람을 처리하기 위한 핸들러
//     FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);
//   }
//
//   static Future<void> _backgroundMessageHandler(RemoteMessage message) async {
//     print("Background Message :  ${message.notification?.title}");
//   }



/* chap 2 !*/

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // 푸시 알림을 관리하기 위한 객체
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    initNotification();
    requestNotificationPermission();

    // 앱 실행 시 토큰을 가져오는 코드
    _firebaseMessaging.getToken().then((token) {
      print("FCM token : $token");

      // 서버로 토큰 전송
      if(token != null){
        sendTokenToServer(token);
      }
    });


    // 포그라운드(앱이 보여지고있는 상태) 상태에서 알람을 처리하기 위한 핸들러
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Foreground message : ${message.notification?.title}");
      showNotification(message.notification?.title, message.notification?.body);
    });

    // 알람을 클릭해서 맵이 열릴 때 핸들러
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("알림을 클릭해서 입이 열리는 상태 : ${message.notification?.title}");
    });


    // 백그라운드 및 종료 상태에서 알람을 처리하기 위한 핸들러
    FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);
  }

  static Future<void> _backgroundMessageHandler(RemoteMessage message) async {
    print("Background Message :  ${message.notification?.title}");
  }


  // 권한 설정 메소드
  Future<void> requestNotificationPermission() async {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }

  // 서버로 토큰을 전송하는 함수
  Future<void> sendTokenToServer(String token) async{
    final response = await http.post(
      Uri.parse("http://localhost:8080"),
      headers : {"Content-Type" : "application/json"},
      body: '{"token": "$token"}',
    );

    if(response.statusCode == 20){
      print("토큰 전송 성공");
    }else{
      print("전송 실패");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("파이어베이스 메세지 테스트"),
      ),
      body: Center(
        child: Text("알림을 기다리다"),
      ),
    );
  }
}

