import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Kokteyler extends StatefulWidget {
  @override
  _KokteylerState createState() => _KokteylerState();
}
class _KokteylerState extends State<Kokteyler>{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('Kokteyller'),

      ),
        body: Column(children: <Widget>[
          Text("Kokteyl Çeşitleri",
            style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget> [
                Padding(
                  padding:EdgeInsets.only(right: 5,left:5,bottom:5 ,top:5 ),
                    child:Container(
                      color: Colors.greenAccent,
                      child: Column(

                        children: <Widget>[
                          Text("Martini"),
                          Image.asset("image/martini.jpeg", width: 250,height: 250,)

                        ],
                      ),

                    ),



                ),
                Padding(
                    padding:EdgeInsets.all(20.0),
                    child: Container(
                      color: Colors.greenAccent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:<Widget> [
                          Text("Gin Fizz"),
                          Image.asset("image/ginfizz.jpeg",width: 250,height: 250,)

                        ],
                      ),


                    )
                ),
                Padding(
                    padding:EdgeInsets.only(right: 5,left:5,bottom:5 ,top:5 ),
                    child: Container(
                      color: Colors.greenAccent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:<Widget> [
                          Text("Gimlet"),
                          Image.asset('image/gimlet.jpeg', width: 250,height: 250,)

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
                  color: Colors.greenAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Mojito"),
                      Image.asset("image/mojito.jpeg", width: 250,height: 250,)

                    ],
                  ),

                ),



              ),
              Padding(
                  padding:EdgeInsets.all(20.0),
                  child: Container(
                    color: Colors.greenAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:<Widget> [
                        Text("Julep"),
                        Image.asset("image/julep.jpeg", width: 250,height: 250,)

                      ],
                    ),


                  )
              ),
              Padding(
                  padding:EdgeInsets.only(right: 5,left:5,bottom:5 ,top:5 ),
                  child: Container(
                    color: Colors.greenAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:<Widget> [
                        Text("Pina Colada"),
                        Image.asset('image/pinacolada.jpeg', width: 250,height: 250,)

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