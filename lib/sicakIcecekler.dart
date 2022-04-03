import 'package:flutter/material.dart';

class SicakIcecekler extends StatefulWidget {
  @override
  _SicakIceceklerState createState() => _SicakIceceklerState();
}
class _SicakIceceklerState extends State<SicakIcecekler>{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: Text('Sıcak İçecekler'),

      ),
        body: Column(children: <Widget>[
          Text("Sıcak İçecekler",
            style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                Padding(
                  padding:EdgeInsets.only(right: 5,left:5,bottom:5 ,top:5 ),
                  child:Container(
                    color: Colors.orange[900],
                    child: Column(

                      children: <Widget>[
                        Text("Çay Çeşitleri"),
                        Image.asset("image/papatyacayı.jpeg", width: 250,height: 250,)

                      ],
                    ),

                  ),



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
                    color: Colors.orange[900],
                    child: Column(

                      children: <Widget>[
                        Text("Kahve Çeşitleri"),
                        Image.asset("image/kahvelatte.jpeg", width: 250,height: 250,)

                      ],
                    ),

                  ),



                ),

              ],
            ),


          ),

        ],

        ),




    );



  }

}