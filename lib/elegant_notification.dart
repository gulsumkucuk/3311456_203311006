import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ElegantNotificationKullanimi extends StatefulWidget {
  const ElegantNotificationKullanimi({Key? key}) : super(key: key);

  @override
  State<ElegantNotificationKullanimi> createState() =>
      _ElegantNotificationKullanimiState();
}

class _ElegantNotificationKullanimiState
    extends State<ElegantNotificationKullanimi> {
  final List<String> daysOfWeek = [
    'Pazartesi',
    'Salı',
    'Çarşamba',
    'Perşembe',
    'Cuma',
    'Cumartesi',
    'Pazar',
  ];

  final List<String> motivationalMessages = [
    'Yeni başlangıçlar sizi bekliyor!',
    'Bugün güzel bir gün geçir!',
    'Sıkı dur, ortası geldi!',
    'Hafta sonu yaklaşıyor, motive ol!',
    'Cuma günü, haftayı tamamladın!',
    'Keyifli bir Cumartesi geçir!',
    'Rahatla ve dinlen, Pazar geldi!',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          'Motivasyon',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < daysOfWeek.length; i++)
            Column(
              children: [
                Text(
                  '${daysOfWeek[i]} motivasyonu göster',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                buildNotificationButton(
                  title: daysOfWeek[i],
                  description: motivationalMessages[i],
                  delay: i,
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget buildNotificationButton({
    required String title,
    required String description,
    required int delay,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: DateTime.now().weekday == delay + 1 ? 1.0 : 0.5,
          duration: Duration(milliseconds: 500),
          child: GestureDetector(
            onTap: () {
              ElegantNotification.success(
                width: MediaQuery.of(context).size.width,
                notificationPosition: NotificationPosition.bottomLeft,
                animation: AnimationType.fromLeft,
                title: Text(title),
                description: Text(description),
              ).show(context);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 150,
              height: 60,
              child: Center(
                child: Text(
                  'Bildirimi Göster',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


