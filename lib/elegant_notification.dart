import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ElegantNotificationKullanimi extends StatefulWidget {
  const ElegantNotificationKullanimi({Key? key}) : super(key: key);

  @override
  State<ElegantNotificationKullanimi> createState() => _ElegantNotificationKullanimiState();
}

class _ElegantNotificationKullanimiState extends State<ElegantNotificationKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:
    AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      title: Text('motivasyon',
        style: TextStyle(color: Colors.black),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                child: ElegantNotification.success(
                  width: MediaQuery.of(context).size.width,
                  notificationPosition: NotificationPosition.bottomLeft,
                  animation: AnimationType.fromLeft,
                  title: const Text('motivasyon'),
                  description: const Text(' başarıyla yapıldı'),

                ).show(context);
              },
              child: Container(
                decoration:BoxDecoration(color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                width: 150,
                height: 60,
                child: const Center(
                  child: Text('bildirimi Göster',
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
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                child: ElegantNotification.success(
                  width: MediaQuery.of(context).size.width,
                  notificationPosition: NotificationPosition.bottomLeft,
                  animation: AnimationType.fromLeft,
                  title: const Text('güncelleme'),
                  description: const Text('başarıyla yapıldı'),

                ).show(context);
              },
              child: Container(
                decoration:BoxDecoration(color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                width: 150,
                height: 60,
                child: const Center(
                  child: Text('bildirimi Göster',
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
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                child: ElegantNotification.success(
                  width: MediaQuery.of(context).size.width,
                  notificationPosition: NotificationPosition.bottomLeft,
                  animation: AnimationType.fromLeft,
                  title: const Text('güncelleme'),
                  description: const Text('güncelleme başarıyla yapıldı'),

                ).show(context);
              },
              child: Container(
                decoration:BoxDecoration(color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                width: 150,
                height: 60,
                child: const Center(
                  child: Text('bildirimi Göster',
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
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                child: ElegantNotification.success(
                  width: MediaQuery.of(context).size.width,
                  notificationPosition: NotificationPosition.bottomLeft,
                  animation: AnimationType.fromLeft,
                  title: const Text('güncelleme'),
                  description: const Text('güncelleme başarıyla yapıldı'),

                ).show(context);
              },
              child: Container(
                decoration:BoxDecoration(color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                width: 150,
                height: 60,
                child: const Center(
                  child: Text('bildirimi Göster',
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
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                child: ElegantNotification.success(
                  width: MediaQuery.of(context).size.width,
                  notificationPosition: NotificationPosition.bottomLeft,
                  animation: AnimationType.fromLeft,
                  title: const Text('güncelleme'),
                  description: const Text('güncelleme başarıyla yapıldı'),

                ).show(context);
              },
              child: Container(
                decoration:BoxDecoration(color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                width: 150,
                height: 60,
                child: const Center(
                  child: Text('bildirimi Göster',
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
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                child: ElegantNotification.success(
                  width: MediaQuery.of(context).size.width,
                  notificationPosition: NotificationPosition.bottomLeft,
                  animation: AnimationType.fromLeft,
                  title: const Text('güncelleme'),
                  description: const Text('güncelleme başarıyla yapıldı'),

                ).show(context);
              },
              child: Container(
                decoration:BoxDecoration(color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                width: 150,
                height: 60,
                child: const Center(
                  child: Text('bildirimi Göster',
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
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                child: ElegantNotification.success(
                  width: MediaQuery.of(context).size.width,
                  notificationPosition: NotificationPosition.bottomLeft,
                  animation: AnimationType.fromLeft,
                  title: const Text('güncelleme'),
                  description: const Text('güncelleme başarıyla yapıldı'),

                ).show(context);
              },
              child: Container(
                decoration:BoxDecoration(color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                width: 150,
                height: 60,
                child: const Center(
                  child: Text('bildirimi Göster',
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
          ],
        ),

    ],),);
  }
  
}
