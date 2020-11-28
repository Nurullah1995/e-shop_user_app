import 'package:ecommerce/data/HomePageTestData.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SigleItemSize extends StatelessWidget {
  String SizeName;
  SigleItemSize(this.SizeName);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Padding(
        padding:EdgeInsets.all(10.0) ,
        child:  OutlineButton(
          child: Text(SizeName,
            style:GoogleFonts.comfortaa( fontSize: 16,color: Colors.black, fontWeight: FontWeight.bold),
          ),
          onPressed: (){},
        ),
      ),
    );
  }
}
