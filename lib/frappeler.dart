import 'package:flutter/material.dart';

class Frappeler extends StatefulWidget {
  @override
  _FrappelerState createState() => _FrappelerState();
}
class _FrappelerState extends State<Frappeler>{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Frappeler'),

      ),
        body: Column(children: <Widget>[
          Text("Frappe Çeşitleri",
            style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget> [
                Padding(
                  padding:EdgeInsets.only(right: 5,left:5,bottom:5 ,top:5 ),
                  child:Container(
                    color: Colors.brown,
                    child: Column(

                      children: <Widget>[
                        Text("Dondurmalı Frappe"),
                        Image.asset("image/dondurmalıf.jpeg", width: 250,height: 250,)

                      ],
                    ),

                  ),



                ),
                Padding(
                    padding:EdgeInsets.all(20.0),
                    child: Container(
                      color: Colors.brown,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:<Widget> [
                          Text("Espresso Frappe"),
                          Image.asset("image/espressof.jpeg",width: 250,height: 250,)

                        ],
                      ),


                    )
                ),
                Padding(
                    padding:EdgeInsets.only(right: 5,left:5,bottom:5 ,top:5 ),
                    child: Container(
                      color: Colors.brown,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:<Widget> [
                          Text("Greek Frappe"),
                          Image.asset('image/greekf.jpeg', width: 250,height: 250,)

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
                      color: Colors.brown,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Browni Frappe"),
                          Image.asset("image/brownif.jpeg", width: 250,height: 250,)

                        ],
                      ),

                    ),



                  ),
                  Padding(
                      padding:EdgeInsets.all(20.0),
                      child: Container(
                        color: Colors.brown,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:<Widget> [
                            Text("karamelli Frappe"),
                            Image.asset("image/karamelf.jpeg", width: 250,height: 250,)

                          ],
                        ),


                      )
                  ),
                  Padding(
                      padding:EdgeInsets.only(right: 5,left:5,bottom:5 ,top:5 ),
                      child: Container(
                        color: Colors.brown,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:<Widget> [
                            Text("Menengiç Frappe"),
                            Image.asset('image/menengiçf.jpeg', width: 250,height: 250,)

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