import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DemoPage extends StatefulWidget {
//  final Widget child;
//  DemoPage({Key key, this.child,}) : super(key: key);
String description;
  DemoPage(this.description);

  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {

  bool descTextShowFlag = false;

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(16.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.description,
                style:GoogleFonts.comfortaa( fontSize: 18,color: Colors.black, fontWeight: FontWeight.bold),
                maxLines: descTextShowFlag ? 8 : 2, textAlign: TextAlign.start),
            InkWell(
              onTap: () {
                setState(() {
                  descTextShowFlag = !descTextShowFlag;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  descTextShowFlag ? Text(
                    "Show Less", style: TextStyle(color: Colors.blue),) : Text(
                      "Show More", style: TextStyle(color: Colors.blue))
                ],
              ),
            ),
          ],
        ),
    );
  }
}