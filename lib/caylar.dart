import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Caylar extends StatefulWidget {
  @override
  _CaylarState createState() => _CaylarState();

}
class _CaylarState extends State<Caylar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Çaylar'),

      ),
        body:Column(children: <Widget>[
          Text("Çay Çeşitleri",
            style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget> [
                Padding(
                  padding:EdgeInsets.only(right: 5,left:5,bottom:5 ,top:5 ),
                  child:Container(
                    color: Colors.yellow,
                    child: Column(

                      children: <Widget>[
                        Text("Ada Çayı"),
                        Image.asset("image/adacayı.jpeg", width: 250,height: 250,)

                      ],
                    ),

                  ),



                ),
                Padding(
                    padding:EdgeInsets.all(20.0),
                    child: Container(
                      color: Colors.yellow,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:<Widget> [
                          Text("Kiraz Çayı"),
                          Image.asset("image/kirazcayı.jpeg",width: 250,height: 250,)

                        ],
                      ),


                    )
                ),
                Padding(
                    padding:EdgeInsets.only(right: 5,left:5,bottom:5 ,top:5 ),
                    child: Container(
                      color: Colors.yellow,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:<Widget> [
                          Text("Kayısı Çayı"),
                          Image.asset('image/kayısıcayı.jpeg', width: 250,height: 250,)

                        ],
                      ),


                    )
                ),

              ],
            ),


          ),
          Expanded( child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget> [
              Row(
                children:<Widget>[

                  Padding(
                    padding:EdgeInsets.only(right: 50,left:80,bottom:5 ,top:50 ),
                    child:Container(
                      color: Colors.yellow,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Yeşil Çay"),
                          Image.asset("image/yesilcay.jpeg", width: 250,height: 250,)

                        ],
                      ),

                    ),



                  ),
                  Padding(
                      padding:EdgeInsets.all(20.0),
                      child: Container(
                        color: Colors.yellow,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:<Widget> [
                            Text("Rezene Çayı"),
                            Image.asset("image/rezene.jpeg", width: 250,height: 250,)

                          ],
                        ),


                      )
                  ),
                  Padding(
                      padding:EdgeInsets.only(right: 5,left:5,bottom:5 ,top:5 ),
                      child: Container(
                        color: Colors.yellow,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:<Widget> [
                            Text("Türk Çayı"),
                            Image.asset('image/turkcayı.jpeg', width: 250,height: 250,)

                          ],
                        ),


                      )
                  ),

                ],
              ),


            ],
          ),
          ),
        ],

        ),




    );



  }

}