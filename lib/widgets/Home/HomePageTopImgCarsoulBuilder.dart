import 'package:carousel_slider/carousel_options.dart';
import 'package:ecommerce/data/HomePageTestData.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FistCarsoulBuilder extends StatelessWidget {

  HomePageTestData homedata= HomePageTestData();

  @override
  Widget build(BuildContext context) {
    var hp=MediaQuery.of(context).size.height;
    var hw=MediaQuery.of(context).size.width;
    return CarouselSlider.builder(
        itemCount:homedata.image_list.length,
        itemBuilder:(BuildContext context, int index)=>Container(
          height:hp*0.2,
          width:hw,
          child: Image.asset(homedata.image_list[index],
            fit: BoxFit.fill,
          ),
        ),
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio:2.0,
          autoPlayInterval: Duration(seconds: 3),
          initialPage: 0,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 700),
          autoPlayCurve:Curves.fastOutSlowIn,
          viewportFraction:1.0,
        ));
  }
}
