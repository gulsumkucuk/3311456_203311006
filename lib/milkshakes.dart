import 'package:flutter/material.dart';

class Milkshakes extends StatefulWidget {
  @override
  _MilkshakesState createState() => _MilkshakesState();
}
class _MilkshakesState extends State<Milkshakes>{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Milkshakes'),

      ),
        body: Column(children: <Widget>[
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
                    color: Colors.pink,
                    child: Column(

                      children: <Widget>[
                        Text("Çilekli Milkshake"),
                        Image.asset("image/cileklimilkshake.jpeg", width: 250,height: 250,)

                      ],
                    ),

                  ),



                ),
                Padding(
                    padding:EdgeInsets.all(20.0),
                    child: Container(
                      color: Colors.pink,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:<Widget> [
                          Text("Çikolatalı Milkshake"),
                          Image.asset("image/cikolatalımilkshake.jpeg",width: 250,height: 250,)

                        ],
                      ),


                    )
                ),
                Padding(
                    padding:EdgeInsets.only(right: 5,left:5,bottom:5 ,top:5 ),
                    child: Container(
                      color: Colors.pink,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:<Widget> [
                          Text("Böğürtlenli Milkshake"),
                          Image.asset('image/bogurtlenlimilkshake.jpeg', width: 250,height: 250,)

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
                      color: Colors.pink,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Muzlu Milkshake"),
                          Image.asset("image/muzlumilkshake.jpeg", width: 250,height: 250,)

                        ],
                      ),

                    ),



                  ),
                  Padding(
                      padding:EdgeInsets.all(20.0),
                      child: Container(
                        color: Colors.pink,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:<Widget> [
                            Text("Limonlu Milkshake"),
                            Image.asset("image/limonlum.jpeg", width: 250,height: 250,)

                          ],
                        ),


                      )
                  ),
                  Padding(
                      padding:EdgeInsets.only(right: 5,left:5,bottom:5 ,top:5 ),
                      child: Container(
                        color: Colors.pink,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:<Widget> [
                            Text("Ananaslı Milkshake"),
                            Image.asset('image/ananaslım.jpeg', width: 250,height: 250,)

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