import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../main.dart';

void notifs() async {
  var scheduledNotificationDateTime = DateTime.now().add(Duration(seconds: 10));

  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'alarm_notif',
    'alarm_notif',
    'Channel for Alarm notification',
    icon: 'codex_logo',
  );
  var iOSPlatformChannelSpecifics = IOSNotificationDetails(
      presentAlert: true, presentBadge: true, presentSound: true);
  var platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.schedule(
      0,
      'Fajr Time',
      'Good morning, its time to pray hoe',
      scheduledNotificationDateTime,
      platformChannelSpecifics);
}
