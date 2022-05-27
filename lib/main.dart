import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:food_app/screens/signIn/sign_in_screen.dart';
import 'package:food_app/statemanagement/providerThemeApp.dart';
import 'package:food_app/theme.dart';
import 'package:provider/provider.dart';
import 'components/bottom_nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FirebaseDatabase.instance;

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    await Firebase.initializeApp().whenComplete(() => runApp(const MyApp()));
  });
  // runApp(const MyApp());
}

DatabaseReference usersRef = FirebaseDatabase.instance.ref().child("users");

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => ChangeThemeApp())],
      child: Consumer<ChangeThemeApp>(
          builder: ((context, value, child) => MaterialApp(
                title: 'Food App',
                debugShowCheckedModeBanner: false,
                theme: value.firstTheme ?? buildThemeData(),
                home: FirebaseAuth.instance.currentUser == null
                    ? const SignInScreen()
                    : const BottomNavBar(),
                // home: OnboardingScreen(),
              ))),
    );
  }
}
