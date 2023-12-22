

import 'package:flutter/material.dart';
import 'package:flutter_proje/sizes_helpers.dart';
import 'constants.dart';
// Import SecondPage class

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
            ),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
  static List<int> genelList = [];
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  List<String> sorular = [
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

                          if (soruIndex == sorular.length - 1) {
                            // All questions answered, check if all are correct
                            if (SoruSayfasi.genelList.every((element) => element == 1)) {
                              _showCongratulatoryDialog(context);
                              // Navigate to the second test page
                              // Add your navigation logic here
                            }
                          } else {
                            soruIndex++;
                          }
                        });
                      },
                    ),
                  ),
                ),
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

                          if (soruIndex == sorular.length - 1) {
                            // All questions answered, check if all are correct
                            if (SoruSayfasi.genelList.every((element) => element == 1)) {
                              _showCongratulatoryDialog(context);
                              // Navigate to the second test page
                              // Add your navigation logic here
                            }
                          } else {
                            soruIndex++;
                          }
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showCongratulatoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Tebrikler!"),
          content: Text("Bütün soruları doğru cevapladınız. İkinci teste geçebilirsiniz."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();

                // Navigate to the second page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(),
                  ),
                );
              },
              child: Text("Tamam"),
            ),
          ],
        );
      },
    );
  }
}
class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<Widget> secimler = [];
  List<String> sorular = [
    "5 tane makine yaklaşık 5 dakika içerisinde 5 düğme üretir. Buna göre 100 tane makine 100 tane düğmeyi 5 dakikada üretir.",
    "Bir tane akvaryum içerisinde 10 tane balık bulunuyor. Bu balıkların 2 tanesi boğulur. Kalanlardan 4 tanesi yüzüyor ve 3 tanesi de ölür. Akvaryum içerisinde 1 balık kalır.",//10
    "Fatma, ayna karşısında sol gözünü sağ eli ile tuttuğunda, ayna karşısında sol gözünü sağ eli ile tutuyor olarak görür",
    "Bir asa ve bir şapkanın toplam fiyatı 110 liradır. Asa şapkadan 100 lira daha pahalıdır. Bu durumda 10 kaç liradır"// 5
    "Doktorunuz size 3 hap verir ve bunları yarımşar saat arayla almanızı tavsiye ederse, ilaçların tamamını bitirmeniz 1.5 saat sürer"//1
    "Ahmet aklından x diye bir sayı tuttu. Bunu 2 ile çarptı ve 10 ekledi. Sonrasında çıkan sayıyı 10'dan çıkarttı. Ardından 2'ye böldü. Ahmetin aklından tuttuğu sayı İlk tuttuğuyla aynıdır. Yani cevap ' x ' "
    "İki fare, iki krakeri iki dakikada yiyor. 18 krakeri 6 dakikada 2 fare yer"//6
    "Gece saat sekizde yatıyorum ve yatarken guguklu saatimi sabah dokuza kuruyorum 1 saat uyurum"
  ];

  List<bool> yanitlar = [
    true,
    false,
    true,
    false,
    false,
    true,
    false,
    true,
  ];

  int soruIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Column(
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

                            if (soruIndex == sorular.length - 1) {
                              // All questions answered, check if all are correct
                              if (SoruSayfasi.genelList.every((element) => element == 1)) {
                                _showCongratulatoryDialog(context);
                                // Navigate to the third test page or perform your desired action
                                // Add your navigation logic here
                              }
                            } else {
                              soruIndex++;
                            }
                          });
                        },
                      ),
                    ),
                  ),
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

                            if (soruIndex == sorular.length - 1) {
                              // All questions answered, check if all are correct
                              if (SoruSayfasi.genelList.every((element) => element == 1)) {
                                _showCongratulatoryDialog(context);
                                // Navigate to the third test page or perform your desired action
                                // Add your navigation logic here
                              }
                            } else {
                              soruIndex++;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCongratulatoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Tebrikler!"),
          content: Text("Bütün soruları doğru cevapladınız. İkinci teste geçebilirsiniz."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text("Tamam"),
            ),
          ],
        );
      },
    );
  }
}





