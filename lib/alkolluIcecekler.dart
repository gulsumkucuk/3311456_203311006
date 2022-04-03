import 'package:flutter/material.dart';

class AlkolluIcecekler extends StatefulWidget {
  @override
  _AlkolluIceceklerState createState() => _AlkolluIceceklerState();
}
class _AlkolluIceceklerState extends State<AlkolluIcecekler>{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Alkoller"),

      ),
        body:Column(children: <Widget>[
          Text("Milkshake Çeşitleri",

            style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),

          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget> [
                Padding(
                  padding:EdgeInsets.only(right: 5,left:5,bottom:5 ,top:5 ),
                  child:Container(
                    color: Colors.black45,
                    child: Column(

                      children: <Widget>[
                        Text("Tekila"),
                        Image.asset("image/tekila.jpeg", width: 250,height: 250,)

                      ],
                    ),

                  ),



                ),
                Padding(
                    padding:EdgeInsets.all(20.0),
                    child: Container(
                      color: Colors.black45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:<Widget> [
                          Text("Kırmızı Şarap"),
                          Image.asset("image/kırmızısarap.jpeg",width: 250,height: 250,)

                        ],
                      ),


                    )
                ),
                Padding(
                    padding:EdgeInsets.only(right: 5,left:5,bottom:5 ,top:5 ),
                    child: Container(
                      color: Colors.black45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:<Widget> [
                          Text("Beyaz Şarap"),
                          Image.asset('image/beyazsarap.jpeg', width: 250,height: 250,)

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
                      color: Colors.black45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Bira"),
                          Image.asset("image/bira.jpeg", width: 250,height: 250,)

                        ],
                      ),

                    ),



                  ),
                  Padding(
                      padding:EdgeInsets.all(20.0),
                      child: Container(
                        color: Colors.black45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:<Widget> [
                            Text("Rakı"),
                            Image.asset("image/rakı.jpeg", width: 250,height: 250,)

                          ],
                        ),


                      )
                  ),
                  Padding(
                      padding:EdgeInsets.only(right: 5,left:5,bottom:5 ,top:5 ),
                      child: Container(
                        color: Colors.black45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:<Widget> [
                            Text("Viski"),
                            Image.asset('image/viski.jpeg', width: 250,height: 250,)

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