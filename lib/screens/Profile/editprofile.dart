import 'package:ecommerce/screens/HomePage/HomePageBody.dart';
import 'package:ecommerce/screens/HomePage/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  EditProfile({
    Key key,
  }) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  TextEditingController userNameCtlr;
  TextEditingController emailCtlr;
  TextEditingController phoneCtlr;

  @override
  void initState() {
    super.initState();
//    userNameCtlr = TextEditingController(text: "${widget.mydata.id}");
//    emailCtlr =
//        TextEditingController(text: "${widget.mydata.productName}");
//    phoneCtlr =
//        TextEditingController(text: "${widget.mydata.productDescription}");
  }


  @override
  Widget build(BuildContext context) {
    var hp=MediaQuery.of(context).size.height;
    var hw=MediaQuery.of(context).size.width;
    return new Scaffold(
      resizeToAvoidBottomInset: false,
   //   backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          tooltip: 'Next page',
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePageBody()));

          },
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20.0, 20, 0),
            child: GestureDetector(
              onTap: () {
                Route route =
                    MaterialPageRoute(builder: (context) => HomePageBody());
                Navigator.push(context, route);
              },
              child: Text(
                'Save',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
      body:  SingleChildScrollView(
          child: Column(
            children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                        //  color: Colors.red,
                          child: Text('User Name :',style: TextStyle(fontSize: 18,color: Colors.black),),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                        //  color: Colors.black,
                          child: TextField(
                            controller: userNameCtlr,
                            obscureText: false,
                            decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(32.0))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        //  color: Colors.red,
                        child: Text('Email :',style: TextStyle(fontSize: 18,color: Colors.black),),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        //  color: Colors.black,
                        child: TextField(
                          controller: emailCtlr,
                          obscureText: false,
                          decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0))),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        //  color: Colors.red,
                        child: Text('Phone No :',style: TextStyle(fontSize: 18,color: Colors.black),),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        //  color: Colors.black,
                        child: TextField(
                          controller: phoneCtlr,
                          obscureText: false,
                          decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0))),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}

