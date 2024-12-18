// 알림 플러그인 인스턴스 생성
import 'dart:typed_data';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin notifications =
    FlutterLocalNotificationsPlugin();

initNotification() async {
  // 안드로이드 초기화 설정
  var androidInitialization = AndroidInitializationSettings(
      "app_icon"); // 확장자 빼고 이름 넣기 (png) - 경로: /android/app/src/main/res/drawable

  // ios 설정 - 권한
  var iosSetting = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  var initializationSettings =
      InitializationSettings(android: androidInitialization, iOS: iosSetting);

  // 초기화 실행
  await notifications.initialize(initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
    // 알림이 떠있을 때 - 클릭 시
    print("알림이 클릭됨 : ${response.payload}");
    // 알림마다 설정 가능.. payload는 보통 문자열이고, 특정 페이지 내용을 담아 보냄 - 확인해서 라우트로 특정 페이지 띄워줄 수 있다.
  });

  // Android 알림 채널 생성
  var androidChannel = AndroidNotificationChannel(
    "test_id", //채털 id 중복되면 안됨
    "테스트 채널", // 채널 이름
    description: "알림에 대한 설명",
    importance: Importance.max, // 알림의 중요도 설정
    playSound: true, // 소리 설정
    enableVibration: true, // 진동 설정
    vibrationPattern: Int64List.fromList([0, 1000]), // 진동 패턴
  );

  // 채널 등록
  try {
    await notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);

    print("테스트 채널 생성완료");
  } catch (e) {
    print("테스트 채널 생성 오류 : $e");
  }
}
