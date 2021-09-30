import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:karmik/providers/labour.dart';
import 'package:karmik/screens/contractors/carpenter_screen.dart';
import 'package:karmik/screens/contractors/electrification_screen.dart';
import 'package:karmik/screens/contractors/flooring_screen.dart';
import 'package:karmik/screens/contractors/mason_screen.dart';
import 'package:karmik/screens/contractors/painter_screen.dart';
import 'package:karmik/screens/contractors/plastering_screen.dart';
import 'package:karmik/screens/contractors/plumbing_screen.dart';
import 'package:karmik/screens/contractors/truss_work_screen.dart';
import 'package:karmik/screens/details_screen.dart';
import 'package:karmik/screens/join/join_now_screen.dart';
import 'package:karmik/screens/join/professionals_deatails_screen.dart';
import 'package:karmik/screens/machinery/backhoe_screen.dart';
import 'package:karmik/screens/machinery/bulldozers_screen.dart';
import 'package:karmik/screens/machinery/concrete_mixer.dart';
import 'package:karmik/screens/machinery/cranes_screen.dart';
import 'package:karmik/screens/machinery/dragline_screen.dart';
import 'package:karmik/screens/machinery/dumpper.dart';
import 'package:karmik/screens/machinery/graders_screen.dart';
import 'package:karmik/screens/machinery/loaders_screen.dart';
import 'package:provider/provider.dart';

import '../screens/category/plastering.dart';
import '../screens/engineer_category_screen.dart';
import '../screens/machinery/excavator_screen.dart';
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
        ChangeNotifierProvider(
          create: (context) => Labours(),
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
              return CircularProgressIndicator();
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
          ExcavatorScreen.routeName: (context) => ExcavatorScreen(),
          BackHoeScreen.routeName: (context) => BackHoeScreen(),
          DragLineScreen.routeName: (context) => DragLineScreen(),
          BulldozerScreen.routeName: (context) => BulldozerScreen(),
          GradersScreen.routeName: (context) => GradersScreen(),
          DumperScreen.routeName: (context) => DumperScreen(),
          LoaderScreen.routeName: (context) => LoaderScreen(),
          CranesScreen.routeName: (context) => CranesScreen(),
          ConcreteMixerScreen.routeName: (context) => ConcreteMixerScreen(),
          CarpenterScreen.routeName: (context) => CarpenterScreen(),
          ExcavatorScreen.routeName: (context) => ExcavatorScreen(),
          FlooringScreen.routeName: (context) => FlooringScreen(),
          MasonScreen.routeName: (context) => MasonScreen(),
          PainterScreen.routeName: (context) => PainterScreen(),
          PlasteringScreen.routeName: (context) => PlasteringScreen(),
          TrussWorkScreen.routeName: (context) => TrussWorkScreen(),
          ElectrificationScreen.routeName: (context) => ElectrificationScreen(),
          PlumbingScreen.routeName: (context) => PlumbingScreen(),
          JoinNowScreen.routeName: (context) => JoinNowScreen(),
          ProfessionalDetailsScreen.routeName: (context) => ProfessionalDetailsScreen(),
          DetailsScreen.routeName: (context) => DetailsScreen(),
        },
      ),
    ));
  }
}
