

// 알림 플러그인 인스턴스 생성

import 'dart:typed_data';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin notifications =
    FlutterLocalNotificationsPlugin();

initNotification() async {
  // 안드로이드 초기화 설정
  var androidInitialization = AndroidInitializationSettings("app_icon");

  // ios 설정
  var iosSetting = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  // 그냥 알림을 쓰기 위해서 초기화 해주는 코드. 그대로 가져다가 쓰면 된다.
  var initializationsSettings = InitializationSettings(
    android: androidInitialization, iOS: iosSetting
  );

  // 초기화 실행
  await notifications.initialize(
      initializationsSettings,
      // onDidReceiveNotificationResponse->  알림을 클릭했을 때 실행될 애
      onDidReceiveNotificationResponse: (NotificationResponse response){
        print("알림이 클릭됨 : ${response.payload}");
        // show_noti 에서 만들어서 찍어준 문자열을 (알림마다 개발자가 알아볼 수 있는 문자열) 찍어봄으로써
        // 어느 알림이고, 이 알림을 눌렀을 때 어느 페이지로 가고싶은지 이런 액션을을 구성해줄 수 있다.
      },
  );

  // Android 알림 채널 생성
  // 안드로이드는 알림 채널을 생성해줘야 한다. 설명, id 뭐 이런거 설정 해야함
  var androidChannel = AndroidNotificationChannel(
    "test_id", // 채널 id 중복되면 안됨 (!필수!)
    "테스트 채널", // 채널 이름 (!필수!)
    // 밑에 나머지는 옵션들
    description: "알림에 대한 설명",
    importance: Importance.max, //알림의 중요도 설정
    playSound: true, // 소리 설정
    enableVibration: true, // 진동 설정
    vibrationPattern: Int64List.fromList([0, 1000]), // 진동 패턴
  );

  // 채널 등록
  try{
    await notifications
        .resolvePlatformSpecificImplementation
        <AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);
    print("test 채널 생성 완료");
  }catch(e){
    print("test 채널 생성 오류 $e");
  }
}
