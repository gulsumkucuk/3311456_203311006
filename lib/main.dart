import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_proje/genel.dart';
import 'package:flutter_proje/information.dart';
import 'package:flutter_proje/ing.dart';
import 'package:flutter_proje/locator.dart';
import 'package:flutter_proje/page/notes_page.dart';
import 'package:flutter_proje/screens/login_screen/login_screen.dart';
import 'package:flutter_proje/services/provider/auth_provider.dart';

import 'package:provider/provider.dart';





import 'bar_chart_sample6.dart';
import 'homePage.dart';
import 'kitap.dart';
import 'utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AuthProvider>(create: (context) => locator.get<AuthProvider>(),)
  ], child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: kPrimaryColor,
              fontFamily: 'Montserrat',
            ),
      ),
      home: const LoginScreen(),
    );
  }
}
void main1() {
  runApp(MyApp());
}
class MyApp1 extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,



      routes: {
        "/Ingilizce": (context)=> Ingilizce(),
        "/Genel": (context)=> Genel(),
        "/Information": (context)=> Information(),
        "/NotesPage": (context)=> NotesPage(),
        "/LineChartSample2": (context)=> BarChartSample6(),
        "/Home": (context)=> Home(),
      },
      home: HomePage(),
    );
  }
}
Future main2() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp2 extends StatelessWidget {
  static final String title = 'Notes SQLite';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    themeMode: ThemeMode.dark,
    theme: ThemeData(
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.blueGrey.shade900,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    ),
    home: NotesPage(),
  );}


