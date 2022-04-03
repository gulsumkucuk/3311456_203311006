import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proje_odev/alkolluIcecekler.dart';
import 'package:proje_odev/caylar.dart';
import 'package:proje_odev/kokteyller.dart';
import 'package:proje_odev/loginScreen.dart';
import 'package:proje_odev/sogukIcecekler.dart';
import 'package:proje_odev/kahveler.dart';
import 'package:proje_odev/milkshakes.dart';
import 'package:proje_odev/frappeler.dart';
import 'package:proje_odev/sicakIcecekler.dart';





void main (){
  runApp(MyApp ());
}
class MyApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: "demo",
      debugShowCheckedModeBanner: false,
     routes: {
       "/": (context) => LoginScreen(),
       "/sogukIcecekler":(context) => SogukIcecekler(),
       "/sicakIcecekler":(context) => SicakIcecekler(),
       "/caylar":(context) => Caylar(),
       "/kahveler":(context) => Kahveler(),
       "/milkshakes":(context) => Milkshakes(),
       "/alkolluIcecekler":(context) => AlkolluIcecekler(),
       "/frappeler":(context) => Frappeler(),
       "/kokteyller":(context) => Kokteyler(),



     },


    );
  }
}
