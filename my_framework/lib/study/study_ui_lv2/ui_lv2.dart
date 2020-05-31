import 'package:flutter/material.dart';
import 'package:my_framework/study/study_ui_lv2/profile/profile_app.dart';
import 'package:my_framework/study/study_ui_lv2/profile2/profile2.dart';

import '../study_screen.dart';
import 'burger_truck/burger_truck.dart';
import 'car_service/car_service.dart';
import 'cards/card_app.dart';
import 'chef_profile/chelf_profile.dart';
import 'dialog/dialog.dart';
import 'fashion/fashion.dart';
import 'fashion3/fashion3.dart';
import 'food_order/food_order.dart';
import 'fruiter2/fruit2.dart';
import 'furniture/furniture.dart';
import 'furniture2/furniture2.dart';
import 'gourmet/gourmet.dart';
import 'hair_style/hair_style.dart';
import 'hire_talent/hire_talent_app.dart';
import 'img_carousel/image_carousel.dart';
import 'login_ui/login_app.dart';
import 'minimal/minimal.dart';
import 'minimal_design/minimal_design.dart';
import 'product_description/product_description.dart';
import 'rental/rental.dart';
import 'shopping2/shopping2.dart';
import 'travel_diary/travel_diary.dart';


class UILevel2 extends StatefulWidget {
  @override
  _UILevel2State createState() => _UILevel2State();
}

class _UILevel2State extends State<UILevel2> {
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
            _item("Hire Talent",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>HireTalentApp()))),
            _item("SignIn App",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginApp()))),
            _item("Profile App",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>ProfileApp()))),
            _item("Card App",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>CardApp()))),
            _item("Image Carousel App",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>ImageCarousel()))),
            _item("Bugger App",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>BurgerTruck()))),
            _item("Travel diary App",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>TravelDiary()))),
            _item("Food order App",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>FoodOrder()))),
            _item("Furniture  App",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>FurnitureApp()))),
            _item("Furniture  App2",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>Furniture2()))),
            _item("Production  App",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDescription()))),
            _item("Shopping2  App",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>Shopping2()))),
            _item("Dialog  App",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>MyDialog()))),
            _item("Minimal design",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>MinimalDesign()))),
            _item("fashion design",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>Fashion()))),
            _item("Chelf design",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>ChelfProfile()))),
            _item("Hair style",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>HairStyle()))),
            _item("Gourmet",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>Gourmet()))),
            _item("Minimal app",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>MinimalApp()))),
            _item("Fruiter2 app",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>FruitApp2()))),
            _item("Profile app",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>Profile2()))),
            _item("Car servcie app",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>CarService()))),
            _item("Rental servcie app",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>RentalServiceApp()))),
            _item("Fashion3 app",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>Fashion3()))),
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
