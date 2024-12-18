// 특정 알림을 설정할 메소드

// 알림 설정

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'init_noti.dart';

showNotification(String? title, String? content) async {
  // 안드로이드 알림 설정
  // 특정 알림 채널에 등록을 해 주어야 한다.
  var androidDetails = AndroidNotificationDetails(
    "test_id", // channelId
    "테스트 채널", // channerName
    priority: Priority.max, // 우선순위 (알람 순서)
    color: Colors.black,
  );

  // 애플
  var iosDetails = DarwinNotificationDetails(
    presentAlert: true, // 알림이 표시될 때 팝업을 보여줄지
    presentBadge: true, // 아이콘
    presentSound: true,
  );

  notifications.show(
      1, // id - 숫자(고유) : 중복되면 덮어 씌워진다.
      title, // title : 알림 내용
      content, // body
      NotificationDetails(
          android: androidDetails, iOS: iosDetails), // notificationDetails
      payload: "test_payload");
}
