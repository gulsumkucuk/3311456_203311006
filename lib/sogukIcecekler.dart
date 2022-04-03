import 'package:flutter/material.dart';

class SogukIcecekler extends StatefulWidget {
  @override
  _SogukIceceklerState createState() => _SogukIceceklerState();
}
class _SogukIceceklerState extends State<SogukIcecekler>{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[900],
          title: Text('Soğuk İçecekler'),

        ),
        body:  Column(children: <Widget>[
          Text("Sıcak İçecekler Çeşitleri",
            style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                Padding(
                  padding:EdgeInsets.only(right: 5,left:5,bottom:5 ,top:5 ),
                  child:Container(
                    color: Colors.cyan[900],
                    child: Column(

                      children: <Widget>[
                        Text("Frappe Çeşitleri"),
                        Image.asset("image/brownif.jpeg", width: 250,height: 250,)

                      ],
                    ),

                  ),



                ),
                Padding(
                    padding:EdgeInsets.all(20.0),
                    child: Container(
                      color: Colors.cyan[900],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:<Widget> [
                          Text("Milkshake Çeşitleri"),
                          Image.asset("image/bogurtlenlimilkshake.jpeg",width: 250,height: 250,)

                        ],
                      ),


                    )
                ),

              ],
            ),


          ), Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                Padding(
                  padding:EdgeInsets.only(right: 5,left:5,bottom:5 ,top:5 ),
                  child:Container(
                    color: Colors.cyan[900],
                    child: Column(

                      children: <Widget>[
                        Text("Alkol  Çeşitleri"),
                        Image.asset("image/tekila.jpeg", width: 250,height: 250,)

                      ],
                    ),

                  ),



                ),
                Padding(
                    padding:EdgeInsets.all(20.0),
                    child: Container(
                      color: Colors.cyan[900],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:<Widget> [
                          Text("Kokteyl Çeşitleri"),
                          Image.asset("image/martini.jpeg",width: 250,height: 250,)

                        ],
                      ),


                    )
                ),

              ],
            ),


          ),

        ],

        ),




    );



  }

}