import 'package:flutter/material.dart';
import 'package:flutter_proje/sizes_helpers.dart';
import 'constants.dart';

class Genel extends StatefulWidget {
  const Genel({Key? key}) : super(key: key);

  @override
  State<Genel> createState() => _GenelState();
}

class _GenelState extends State<Genel> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.purple,
              title: Text("GENEL KÜLTÜR TESTİ"),
            ),
            body: SafeArea(
                child: Container(
                    height: displayHeight(context),
                    width: displayWidth(context),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "images/blue.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: SoruSayfasi(),
                    )))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
  static List genelList = [];
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  List<String> sorular = [
    "Dünya'nın yüz ölçümü en büyük ülkesi  Rusyadır",
    "Dünya'nın yüz ölçümü en küçük ülkesi  Vatikandır",
    "Dünya Kupası'nı en çok kazanan ülke  Arjantindir",
    "Japonya'nın milli sporu Sumo güreşidir",
    "Beş kıtayı temsil eden beş olimpiyat halkasının renkleri Mavi, siyah, kırmızı, sarı, yeşildir",
    "Dünya üzerinde yaşayan en büyük hayvan olan mavi balinaların boyları ortalama 33dir",
    "Deve'nin üç kalbi vardır",
    "İskoçya'nın 'ulusal hayvanı' unicorndur",
    " World Wide Web (www) Bill Gates icat edildi",
    "Tarihin ilk kameralı telefonu  Nokia 7610dur ",
    "Güneş Sistemi'nin en sıcak gezegeni Venüs'dür",
    "Dünya'nın Güneş'in etrafında döndüğünü Galileo Galilei keşfetmiştir",
    "Güneş Sistemi'nde en çok uyduya sahip olan gezegen Jüpiter'dir",
    "Nike dev dünya markası başlangıçta 'Blue Ribbon Sports' olarak biliniyord",
    "Periyodik tabloda 118 element vardır",
    "İnsan kulağında 3 kemik vardır",
    "İnsan beyninin ağırlığı ortalama 1,5 kg'dır",
    "Yunan mitolojisinde müziğin, sanatın ve Güneş'in tanrısı Apollon'dur"
  ];
   List<bool> yanitlar = [
    true,
    true,
    false,
    true,
    false,
    true,
    false,
    false,
    true,
    false,
    false,
    true,
    true,
    true
  ];

  int soruIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                sorular[soruIndex],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: ElevatedButton(
                              child: Icon(
                                Icons.thumb_down,
                                size: 30.0,
                              ),
                              onPressed: () {
                                bool dogruYanit = yanitlar[soruIndex];
                                setState(() {
                                  if (dogruYanit == false) {
                                    secimler.add(kDogruIconu);
                                    SoruSayfasi.genelList.add(1);
                                  } else {
                                    secimler.add(kYanlisIconu);
                                    SoruSayfasi.genelList.add(0);
                                  }

                                  soruIndex++;
                                });
                              },
                            ))),
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: ElevatedButton(
                              child: Icon(Icons.thumb_up, size: 30.0),
                              onPressed: () {
                                bool dogruYanit = yanitlar[soruIndex];
                                setState(() {
                                  if (dogruYanit == true) {
                                    secimler.add(kDogruIconu);
                                  } else {
                                    secimler.add(kYanlisIconu);
                                  }

                                  soruIndex++;
                                });
                              },
                            ))),
                  ])),
        )
      ],
    );
  }
}
