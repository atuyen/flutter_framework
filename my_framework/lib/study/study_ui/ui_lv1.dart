import 'package:flutter/material.dart';
import 'package:my_framework/study/study_screen.dart';
import 'package:my_framework/study/study_ui/travel_app/travel_app.dart';

import 'ecommerce_shoe_app/shoe_app.dart';
import 'file_manager/file_manager.dart';
import 'foot_app/foot_app.dart';
import 'furniture_app/furniture_app.dart';
import 'gmail_app/gmail_app.dart';
import 'grocery_shoping/grocery_shoping.dart';
import 'happy_birthday/happy_birthday.dart';
import 'home_rental_app/home_rental_app.dart';
import 'login_signup_app/signup.dart';
import 'music_app/music_app.dart';
import 'music_player_app/musichome.dart';
import 'traveler/traveler_app.dart';
import 'trip_app/trip_app.dart';
import 'youtube_app/youtube_app.dart';

class UILevel1 extends StatefulWidget {
  @override
  _UILevel1State createState() => _UILevel1State();
}

class _UILevel1State extends State<UILevel1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          InkWell(
            child: Text("Back"),
            onTap: ()=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>StudyScreen()), (_)=>false),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10,),
            _item("Shoe app",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>ShoeApp()))),
            _item("food app",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>FootApp()))),
            _item("furiutre app",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>FurnitureApp()))),
            _item("gmail",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>GmailHome()))),
            _item("happy birthday",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>HappyBirthdayApp()))),
            _item("travleApp",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>TravelApp()))),
            _item("trip app",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>TripApp()))),
            _item("YoutubeApp",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>YouTubeApp()))),
            _item("Grocery shoping",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>Shopping()))),
            _item("Mucsic player",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>MusicPlayerApp()))),
            _item("Authen App",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>AuthenApp()))),
            _item("Traveler App",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>TravelerApp()))),
            _item("Home Retal",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeRentalApp()))),
            _item("File Manager",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>FileManagerApp()))),
            _item("Mucsic App",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>MusicApp()))),
          ],
        ),
      ),


    );
  }




  Widget _item(text,callBack){
    return Column(
      children: <Widget>[
        InkWell(
          onTap: (){
            callBack();
          },
          child: Text(text),
        ),
        SizedBox(height: 10,),
      ],
    );

  }
}
