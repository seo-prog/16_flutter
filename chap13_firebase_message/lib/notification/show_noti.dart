// 특정 알림을 울리게 할 메소드
// 알림 설정


import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'init_noti.dart';

showNotification(String? title, String? content) async {
  // 안드로이드 알림 설정
  // 특정 알림 채널에 등록을 해 주어야 한다..
  var androidDetails = AndroidNotificationDetails(
    "test_id",
    "테스트채널",
    priority: Priority.max, // Priority -> 우선순위를 정하는거
    color: Colors.black,
  );

  // 애플
  var iosDetails = DarwinNotificationDetails(
    presentAlert: true, // 알림이 표시될 떄 팝업을 보여줄지
    presentBadge: true, // 아이콘
    presentSound: true,
  );

  // id 는 고유숫자, title -> 뜰 내용
  notifications.show(
      1,
      title,
      content,
      NotificationDetails(android: androidDetails, iOS: iosDetails),
      payload: "test_payload"
  );
}
