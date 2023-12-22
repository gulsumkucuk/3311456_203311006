import 'package:flutter/material.dart';
import 'package:flutter_proje/elegant_notification.dart';
import 'package:flutter_proje/genel.dart';
import 'package:flutter_proje/information.dart';
import 'package:flutter_proje/ing.dart';

import 'game.dart';
import 'translate.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_proje/page/notes_page.dart';

import 'package:flutter_proje/sizes_helpers.dart';

import 'translate.dart';
import 'bar_chart_sample6.dart';
import 'kitap.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text("choose your activity"),
        ),
        body: Column(
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [BoxContainer('İngilizce','/Ingilizce','images/ing.png'),
                BoxContainer('Genel','/Genel','images/genel.png'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [BoxContainer('Kelime Oyunu','/WordGame','images/word.png'),
                BoxContainer('Notlar','/Notes','images/notes.png'),],
            ),
            Lottie.network(
              'https://assets1.lottiefiles.com/private_files/lf30_yLIteV.json',),
          ],
        ),
        /*
        Center(
          child: Lottie.network(
            'https://assets1.lottiefiles.com/private_files/lf30_yLIteV.json',),
        ),

         */
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                DrawerHeader(
                  child: Container(
                    height: displayHeight(context),
                    width: displayWidth(context),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "images/soruiss.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                ListTile(
                    leading: Icon(
                      Icons.question_answer_outlined,
                      color: Colors.black,
                    ),
                    title: Text('A1 İNGİLİZCE'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Ingilizce()));
                    }),
                ListTile(
                    leading: Icon(
                      Icons.perm_device_information,
                      color: Colors.black,
                    ),
                    title: Text('GENEL KÜLTÜR'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Genel()));
                    }),
                ListTile(
                    leading: Icon(
                      Icons.perm_device_information,
                      color: Colors.black,
                    ),
                    title: Text('BİLGİLENDİRME'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Information()));
                    }),
                ListTile(
                    leading: Icon(
                      Icons.question_mark,
                      color: Colors.black,
                    ),
                    title: Text('NOTELAR'),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => NotesPage()));
                    }),
                ListTile(
                    leading: Icon(
                      Icons.analytics_outlined,
                      color: Colors.black,
                    ),
                    title: Text('GRAFİK'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BarChartSample6()));
                    }),
                ListTile(
                    leading: Icon(
                      Icons.analytics_outlined,
                      color: Colors.black,
                    ),
                    title: Text('KİTAPLAR'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Home()));
                    }),
                ListTile(
                    leading: Icon(
                      Icons.analytics_outlined,
                      color: Colors.black,
                    ),
                    title: Text('translate'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TranslatorApp()));
                    }),
                ListTile(
                    leading: Icon(
                      Icons.analytics_outlined,
                      color: Colors.black,
                    ),
                    title: Text('kelime oyunu'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => WordMatchingGameScreen()));
                    }),
                ListTile(
                    leading: Icon(
                      Icons.analytics_outlined,
                      color: Colors.black,
                    ),
                    title: Text('günlük motivasyon'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const ElegantNotificationKullanimi()));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BoxContainer extends StatelessWidget {
  final String boxText;
  final String navigationText;
  final String imageName;
BoxContainer(this.boxText,this.navigationText,this.imageName);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, navigationText);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              margin: EdgeInsets.all(5),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imageName),
                fit:BoxFit.fill,
              )
              ),

            ),
          ),

          Text(
            boxText,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
