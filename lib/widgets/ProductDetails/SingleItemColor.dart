import 'package:ecommerce/data/HomePageTestData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SigleItemColorSize extends StatelessWidget {
  HomePageTestData homePageTestData=HomePageTestData();
  String colorName;
  SigleItemColorSize(this.colorName);


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OutlineButton(
          child: Text(colorName,
            style:GoogleFonts.comfortaa( fontSize: 16,color: Colors.black, fontWeight: FontWeight.bold),
          ),
          onPressed: (){},
        ),
      ),
    );

  }
}
