
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'anasayfa.dart';




class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();

}



class _LoginScreenState extends State<LoginScreen> {



  Widget buildEmail(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Email',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold

            ),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft ,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0,2)
                  )
                ]
            ),
            height:60,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              style:TextStyle(
                  color: Colors.black87

              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top:14),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color(0xff6f4d4e),

                  ),
                  hintText: 'Email',
                  hintStyle: TextStyle(
                      color: Colors.black
                  )

              ),

            ),

          )
        ]
    );
  }
  Widget buildPassword(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold

          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft ,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height:60,
          child: TextField(
            obscureText: true,

            style:TextStyle(
                color: Colors.black87

            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top:14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xffec9855),

                ),
                hintText: 'Şifre',
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
          ),

        ),


      ],
    );
  }


  Widget BuildLoginBtn(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          color: Colors.white,
          child: Text(
            'GİRİŞ',
            style: TextStyle(
                color: Colors.orange,
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          ),
        onPressed: () {
       Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
        }

        ),

    );
  }



  @override
  Widget build(BuildContext context){
    return  Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child:GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors:[
                      Colors.orange,
                      Colors.orange,
                      Colors.orange,
                      Colors.orange,



                    ]

                  )
                ),
               child: SingleChildScrollView(
                 physics:AlwaysScrollableScrollPhysics(),
                 padding: EdgeInsets.symmetric(
                   horizontal: 25,
                   vertical: 120
                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Text(
                       'DRİNKS',
                       style: TextStyle(
                           color: Colors.white,
                           fontSize: 40,
                           fontWeight: FontWeight.bold

                       ),
                     ),
                     SizedBox(height: 50),
                     buildEmail(),
                     SizedBox(height: 20),
                     buildPassword(),


                     BuildLoginBtn(),

                   ],
                 ),


  )
              ),
            ],



          ),
        ),
      ),
    );
  }

}
