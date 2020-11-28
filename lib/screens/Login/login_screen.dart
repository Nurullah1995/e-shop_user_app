import 'package:ecommerce/SharePrefarenc/PrefarenceToken.dart';
import 'package:ecommerce/components/already_have_an_account_acheck.dart';
import 'package:ecommerce/components/rounded_button.dart';
import 'package:ecommerce/components/rounded_input_field.dart';
import 'package:ecommerce/components/rounded_password_field.dart';
import 'package:ecommerce/data/login.dart';
import 'package:ecommerce/screens/HomePage/HomeScreen.dart';
import 'package:ecommerce/screens/SignUP/signup_screen.dart';
import 'package:ecommerce/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/background.dart';

class LoginScreen extends StatelessWidget {
  var _scaffolkey=GlobalKey<ScaffoldState>();

  TextEditingController _userNameCtlr=TextEditingController();
  TextEditingController _passCtlr=TextEditingController();

  Widget  _loginAdmin(BuildContext context){
    var email=_userNameCtlr.text;
    var password=_passCtlr.text;
    var loginInfo=Login(email: email,password: password);
    print(email);
    print(password);
    login(loginInfo).then((loginResponse){
      if(loginResponse.access_token==null){
        final snackBar = SnackBar(
          content: Text('Enter Correct User and Password'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        _scaffolkey.currentState.showSnackBar(snackBar);
        // authErrorMessage='this is not authenticate user';
      }
      else
        //  print("auth token : ${loginResponse.access_token}");
        setValue(loginResponse.access_token).then((value) {
          final snackBar = SnackBar(
            content: Text('Enter Correct User and Password'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          _scaffolkey.currentState.showSnackBar(snackBar);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
          _userNameCtlr.clear();
          _passCtlr.clear();
        });

    });

  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffolkey,
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {},
                controller: _userNameCtlr,
              ),
              RoundedPasswordField(
                controller: _passCtlr,
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  _loginAdmin(context);
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
