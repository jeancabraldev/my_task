import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin(); //

  initializeNotification() async {
    tz.initializeTimeZones();
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('appicon');

    final InitializationSettings initializationSettings =
        InitializationSettings(
      iOS: initializationSettingsIOS,
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: selectNotification,
    );
  }

  //
  displayNotification({required String title, required description}) async {
    //print('TESTE DE NOTIFICAÇÕES');
    var androidPlataformChannelSpecifics = const AndroidNotificationDetails(
        'id', 'channel name', 'channel description',
        importance: Importance.max, priority: Priority.high);

    var iOSPlataformsChannelSpecifics = const IOSNotificationDetails();

    var plataformsChannelSpecifics = NotificationDetails(
        android: androidPlataformChannelSpecifics,
        iOS: iOSPlataformsChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      description,
      plataformsChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  //Notificações com 5 segundos
  //Verificar porque não estáapareceno a notificação na tela
  scheduledNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'title',
      'body',
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      const NotificationDetails(
        android: AndroidNotificationDetails(
            'channelId', 'channelName', 'channelDescription'),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  //Notifications Android
  Future selectNotification(String? payLoad) async {
    if (payLoad != null) {
      // ignore: avoid_print
      print('notidication: $payLoad');
    } else {
      // ignore: avoid_print
      print('Notification Done');
    }
    Get.to(
      () => Container(
        color: Colors.white,
      ),
    );
  }

  //Notifications IOS
  Future onDidReceiveLocalNotification(
      int id, String? title, String? description, String? payLoad) async {
    /*showDialog(
      //context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(description),
        actions: const [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('OK'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondScreen(payLoad),
              );
            },
          ),
        ],
      ),
    );*/

    Get.dialog(const Text('Hello World!'));
  }
}
