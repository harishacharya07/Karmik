import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:karmik/screens/category/plastering.dart';
import 'package:karmik/screens/engineer_category_screen.dart';
import 'package:provider/provider.dart';

import '../screens/spalsh_screen.dart';
import '../screens/bottom_navigation_screen.dart';
import '../screens/home_screen.dart';
import 'login/login_google_screen.dart';

import './providers/machinery.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return (MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Machinery(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryIconTheme: IconThemeData(
            color: Color(0xff003366),
          ),
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, userStatus) {
            if (userStatus.connectionState == ConnectionState.waiting) {
              return SplashScreen();
            } else if (userStatus.hasData) {
              return BottomNavigationScreen();
            } else {
              return LoginWithGoogleScreen();
            }
          },
        ),
        routes: {
          LoginWithGoogleScreen.routeName: (context) => LoginWithGoogleScreen(),
          EngineerCategoryScreen.routeName: (context) =>
              EngineerCategoryScreen(),
          PlasteringCategoryScreen.routeName: (context) =>
              PlasteringCategoryScreen(),
        },
      ),
    ));
  }
}
