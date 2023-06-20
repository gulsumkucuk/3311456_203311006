import 'package:flutter/material.dart';
import 'package:flutter_proje/sizes_helpers.dart';
 class Ingilizce extends StatefulWidget {
   const Ingilizce({Key? key}) : super(key: key);
 
   @override
   State<Ingilizce> createState() => _IngilizceState();
 }
 TestYapisi BenimTestim =new TestYapisi();
 class TestYapisi {
   int aktif_sorum = 0;
   List<Icon>d_y_bilgisi=[];
   List <Soru> Sorular = [
     Soru(soru_metni: "A- What’s Jack doing in the garden?",
         a: "He’s watering the flowers.",
         b: " He’s flying in the sky.",
         c: " He’s swimming.",
         d: " He’s buying some books.",
         cevap: "A"),
     Soru(soru_metni: "We can’t make an omelet because ____",
         a: " There are a few eggs in the fridge.",
         b: "There aren’t any eggs in the fridge.",
         c: "There is enough butter.",
         d: "There aren’t any apples on the tree.",
         cevap: "B"),
     Soru(soru_metni: "A: ____ are these shoes?B: 50 TL.",
         a: " What size",
         b: "How old",
         c: "How many",
         d: "How much",
         cevap: "D"),
     Soru(soru_metni: "I can’t buy a car. _____",
         a: " I have got a lot of money.",
         b: " I have got a lot of money.",
         c: "It’s very cheap.",
         d: "We haven’t got a brother or a sister.",
         cevap: "B"),
     Soru(soru_metni: "A rabbit is _____ than a tortoise.",
         a: "slower",
         b: "faster",
         c: "hotter",
         d: "colder",
         cevap: "B"),
     Soru(soru_metni: "Making a cake is ____ making baklava.",
         a: "more difficult than",
         b: "as difficult as",
         c: "not as difficult as",
         d: "as easy as",
         cevap: "C"),
     Soru(soru_metni: "We can’t go swimming today because the sea is ____",
         a: "small",
         b: " easy",
         c: " warm",
         d: "cold",
         cevap: "D"),
     Soru(soru_metni: "We live ___ a big apartment ___ the third floor.",
         a: "in/on",
         b: "near/under",
         c: "on/behind",
         d: "between/next to",
         cevap: "A"),
     Soru(soru_metni: "In my free time, I mostly ______ a song.",
         a: "listen to",
         b: "speak to",
         c: "read",
         d: " write",
         cevap: "A"),
     Soru(soru_metni: "What would you like to have?",
         a: " I’d like to have some orange juice, please.",
         b: "Have you got anything else?",
         c: " No, I wouldn’t like to have coffee.",
         d: " I like drinking tea",
         cevap: "A"),
     Soru(soru_metni: "A- Let’s go to play outside. B- It isn’t a good idea. ____",
         a: "It isn’t raining outside.",
         b: " I’m tired.",
         c: "I prefer football to watching TV.",
         d: "You are very clever.",
         cevap: "B"),
     Soru(soru_metni: "We are going to have a holiday in Marmaris ----",
         a: "yesterday",
         b: "last week",
         c: "this July",
         d: "last summer",
         cevap: "C"),
   ];

   void sonraki_soruya_gec(){
     if (Sorular.length-1 > aktif_sorum)
     {aktif_sorum ++;} else{
       aktif_sorum=0;
     }
   }
   String soru_metnini_yaz(){
     return Sorular[aktif_sorum].Soru_metni;
   }
   String a_sikki_yaz(){
     return Sorular[aktif_sorum].A_sikki;
   }
   String b_sikki_yaz(){
     return Sorular[aktif_sorum].B_sikki;
   }
   String c_sikki_yaz(){
     return Sorular[aktif_sorum].C_sikki;
   }
   String d_sikki_yaz(){
     return Sorular[aktif_sorum].D_sikki;
   }
  void cevabi_kontrol_et(String k_cevabi){
     if(Sorular[aktif_sorum].Cevap==k_cevabi){
       d_y_bilgisi.add(Icon(Icons.check),);

  }
  else {
       d_y_bilgisi.add(Icon(Icons.close),);
   }
  sonraki_soruya_gec();

 }}
class Soru{
  String Soru_metni="";
  String A_sikki="";
  String B_sikki="";
  String C_sikki="";
  String D_sikki="";
  String Cevap="";
  Soru({required String soru_metni, required String a, required String b, required String c, required String d , required String cevap}){
    Soru_metni= soru_metni;
    A_sikki= a;
    B_sikki= b;
    C_sikki= c;
    D_sikki= d;
    Cevap= cevap;
  }


}
 
 class _IngilizceState extends State<Ingilizce> {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
         debugShowCheckedModeBanner: false,
       home: Scaffold(
         
           appBar: AppBar(
             leading: IconButton(
               icon:Icon(Icons.arrow_back , color: Colors.white,) ,

               onPressed:()=> Navigator.of(context).pop(),),

             backgroundColor: Colors.blue,
             title: Text("ingilizce testi"),

           ),

         body: SafeArea(
         child: Container(
         height: displayHeight(context),
     width: displayWidth(context),
     decoration: BoxDecoration(
     image: DecorationImage(
     image: AssetImage(
     "images/blue.jpg",
     ),
     fit: BoxFit.cover,

     ),
     ),

        child: Column(
           children: [
             Expanded(
               flex: 3,
               child: Center(
                 child: Text(
                   BenimTestim.soru_metnini_yaz(),
                   style: TextStyle(fontSize: 30.0),
                 ),
               ),
             ),
             Expanded(
               flex: 1,
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Expanded(
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: ElevatedButton(
                         onPressed: () {
                           setState(() {


                           BenimTestim.cevabi_kontrol_et("A");
                           });},
                         child: Text(BenimTestim.a_sikki_yaz()),
                       ),
                     ),
                   ),
                   Expanded(
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: ElevatedButton(
                         onPressed: () {
                           setState(() {


                           BenimTestim.cevabi_kontrol_et("B");
                           });},
                         child: Text(BenimTestim.b_sikki_yaz()),
                       ),
                     ),
                   ),
                 ],
               ),
             ),
             Expanded(
               flex: 1,
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Expanded(
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: ElevatedButton(
                           onPressed: () {
                             setState(() {


                             BenimTestim.cevabi_kontrol_et("C");
                             });}, child: Text(BenimTestim.c_sikki_yaz())),
                     ),
                   ),
                   Expanded(
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: ElevatedButton(
                         onPressed: () {
                           setState(() {



                           BenimTestim.cevabi_kontrol_et("D");
                           }); },
                         child: Text(BenimTestim.d_sikki_yaz()),
                       ),
                     ),
                   ),
                 ],
               ),
             ),
             Text(
               'Sonuc Bilgisi',
               style: TextStyle(fontSize: 20.0),
             ),
             Wrap(children: BenimTestim.d_y_bilgisi,),
             SizedBox(
               height: 10.0,
             )
           ],
         ),
       ),
     )));
   }
 }