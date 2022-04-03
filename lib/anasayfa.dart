import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();

}
class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
   child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: Text('Drinks Menü'),
      ),
     body: Column(children: <Widget>[
       Text("HOŞGELDİNİZ",
         style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),
       ),
       Expanded(
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children:<Widget> [
             Padding(
               padding:EdgeInsets.only(right: 5,left:5,bottom:5 ,top:5 ),
               child:Container(
                 color: Colors.white,
                 child: Column(

                   children: <Widget>[
                     Text(""),
                     Image.asset("image/drinks.jpeg", width: 600,height: 600,)

                   ],
                 ),

               ),



             ),

           ],
         ),


       ),

     ],

     ),

     drawer: Drawer(
            child: Column(
            children: [
              DrawerHeader(
                  child: Container(
                    color: Colors.white,



                  ),
              ),

              myDrawerItem("Soğuk İçecekler", "/sogukIcecekler"),
              myDrawerItem("Sıcak İçecekler", "/sicakIcecekler"),
              myDrawerItem("Çaylar", "/caylar"),
              myDrawerItem("Kahveler","/kahveler" ),
              myDrawerItem("Milkshakes", "/milkshakes"),
              myDrawerItem("Alkollü İçecekler","/alkolluIcecekler"),
              myDrawerItem("Frappeler", "/frappeler"),
              myDrawerItem("Kokteyller","/kokteyller"),


                ],
              ),
   ),
   ),

      );

  }

  Widget myDrawerItem(String title, String routeName) =>
      ListTile(

          title: Text(title),
          onTap: () => Navigator.pushNamed(context, routeName),
      );

}