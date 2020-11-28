import 'package:ecommerce/SharePrefarenc/PrefarenceToken.dart';
import 'package:ecommerce/components/already_have_an_account_acheck.dart';
import 'package:ecommerce/components/rounded_button.dart';
import 'package:ecommerce/components/rounded_input_field.dart';
import 'package:ecommerce/components/rounded_password_field.dart';
import 'package:ecommerce/data/CreateID.dart';
import 'package:ecommerce/screens/HomePage/HomeScreen.dart';
import 'package:ecommerce/screens/Login/login_screen.dart';
import 'package:ecommerce/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'components/background.dart';
import 'components/or_divider.dart';
import 'components/social_icon.dart';

class SignUpScreen extends StatelessWidget {

  TextEditingController _userNameCtlr = TextEditingController();
  TextEditingController _userEmailCtlr = TextEditingController();
  TextEditingController _passCtlr = TextEditingController();
  TextEditingController _conpassCtlr = TextEditingController();
  TextEditingController _phoneCtlr = TextEditingController();


  _createid() {
    var name = _userNameCtlr.text;
    var email = _userEmailCtlr.text;
    var password = _passCtlr.text;
    var password_confirmation = _conpassCtlr.text;
    var phone = _phoneCtlr.text;
    var createidInfo = CreateID(
      name: name,
      email: email,
      password: password,
      password_confirmation: password_confirmation,
      phone: phone,
    );
    print(email);
    print(password);
    createid(createidInfo).then((createidResponse) {
      print(createidResponse.access_token);
      setValue(createidResponse.access_token);
      getValue();
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "SIGNUP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/signup.svg",
                height: size.height * 0.35,
              ),
              RoundedInputField(
                hintText: "User Name",
                onChanged: (value) {},
                controller: _userNameCtlr,
              ),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {},
                controller:_userEmailCtlr ,
              ),
              RoundedInputField(
                hintText: "Phone",
                onChanged: (value) {},
                controller:_phoneCtlr ,
              ),
              RoundedPasswordField(
                hintText: 'Password',
                onChanged: (value) {},
                controller: _passCtlr,
              ),
              RoundedPasswordField(
                hintText: 'Confirm Password',
                onChanged: (value) {},
                controller: _conpassCtlr,
              ),
              RoundedButton(
                text: "SIGNUP",
                press: () {
                  _createid();
                  getValue() == null
                      ? CircularProgressIndicator()
                      : Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyHomePage()));

                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
