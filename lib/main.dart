import 'package:ecommerce/providers/AddToCart.dart';
import 'package:ecommerce/providers/auth_provider.dart';
import 'package:ecommerce/providers/user_profile.dart';
import 'package:ecommerce/screens/HomePage/HomePageBody.dart';
import 'package:ecommerce/screens/Login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>.value(
          value: AuthProvider(),
        ),
        ChangeNotifierProvider<AddToCartProvider>.value(
          value: AddToCartProvider(),
        ),
        ChangeNotifierProvider<UserProfileProvider>.value(
          value: UserProfileProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Antopolis',
        theme: ThemeData(
          primaryColor: Colors.white,
          primaryColorDark: Colors.grey,
          appBarTheme: AppBarTheme(
              // elevation: 0, // This removes the shadow from all App Bars.
              ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) =>LoginScreen(),
              //LoginScreen(),
          '/home_pageBody': (context) => HomePageBody(),
        },
      ),
    );
  }
}

