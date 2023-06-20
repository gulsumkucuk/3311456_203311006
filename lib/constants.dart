import 'package:flutter/material.dart';
const Icon kDogruIconu =Icon(Icons.mood,color: Colors.green,);
const Icon kYanlisIconu =Icon(Icons.mood_bad,color: Colors.red,);


class Kitap {
  String image;
  String kitapAdi;
  String yayinEvi;
  String yazar;
  String fiyat;
  Kitap({
    required this.image,
    required this.kitapAdi,
    required this.yayinEvi,
    required this.yazar,
    required this.fiyat
  });
}