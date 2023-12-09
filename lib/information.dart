
import 'package:flutter/material.dart';

import 'package:flutter_proje/sizes_helpers.dart';
class Information extends StatefulWidget {


  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {

  @override
  Widget build(BuildContext context) {
    var listItems= [
      ListTile(
        tileColor: Colors.yellowAccent,
        title: Text(''),
      ),
      ListTile(
        tileColor: Colors.yellowAccent,
        title: Text(''),
      ),
    ];

    List<String> names=['A1 İNGİLİZCE TESTİNDE;4 şıktan biri doğrudur eğer yanlış cevaplarsanız sonuç kısmında çarpı işareti, doğru cevaplarsanız tik doğru işareti gelmektedir '
        ,'GENEL KÜLTÜR TESTİNDE; 2 şık vardır eğer yanlış işaretlerseniz kırmızı üzgün surat, doğru işaretlerseniz yeşil gülen surat gelmektedir'];
    return Scaffold(



        appBar: AppBar(
        leading: IconButton(
        icon:Icon(Icons.arrow_back , color: Colors.white,) ,

    onPressed:()=> Navigator.of(context).pop(),),

    backgroundColor: Colors.yellow,
    title: Text("Bilgilendirme"),

    ),

    body: SafeArea(
    child: Container(
    height: displayHeight(context),
    width: displayWidth(context),
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage(
    "images/que.jpg",
    ),
    fit: BoxFit.cover,

    ),
    ),

    child: Center(
      child: FractionallySizedBox(
        widthFactor: 0.8,
      heightFactor: 0.3,

      child:ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context,_){
          return VerticalDivider(width: 5,color: Colors.black,);
        },

        padding: EdgeInsets.all(8),
        itemCount: listItems.length,
        itemBuilder:(context,index) {
          var containers = names
              .map((name)=>
          Container(
            height:200,
            width:200,
            margin:EdgeInsets.all(8), padding: EdgeInsets.all(8),color: Colors.yellowAccent,child: Text(name),))
              .toList();
          return containers[index];
        },

      )
    )))));}}