import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Kahveler extends StatefulWidget {
  @override
  _KahvelerState createState() => _KahvelerState();
}
class _KahvelerState extends State<Kahveler>{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
     backgroundColor: Colors.brown[800],
       title: Text('Kahveler'),

    ),
        body:  Column(children: <Widget>[
          Text("Kahve Çeşitleri",

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
                        Text("Latte "),
                        Image.asset("image/kahvelatte.jpeg", width: 250,height: 250,)

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
                          Text("Mocca"),
                          Image.asset("image/mocca.jpeg",width: 250,height: 250,)

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
                          Text("Türk Kahvesi"),
                          Image.asset('image/turkkahvesi.jpg', width: 250,height: 250,)

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
                          Text("Americano"),
                          Image.asset("image/americano.jpg", width: 250,height: 250,)

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
                            Text("Filtre Kahve"),
                            Image.asset("image/filtrekahve.jpg", width: 250,height: 250,)

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
                            Text("Espresso"),
                            Image.asset('image/espressokahve.jpg', width: 250,height: 250,)

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