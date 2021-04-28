import 'package:flutter/material.dart';
import 'package:redlink/phone_login_page.dart';
import 'package:redlink/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
//void main() => runApp(
//    MaterialApp(
//        debugShowCheckedModeBanner: false,
//        home: SplashScreen()
//    )
//);



void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MyApp());
}
//void main() async {
//    WidgetsFlutterBinding.ensureInitialized();
//    await Firebase.initializeApp();
//    runApp(
//        MaterialApp(
//            debugShowCheckedModeBanner: false,
//            home: SplashScreen()
//        )
//    );
//}


final _auth = FirebaseAuth.instance;

Future<User> getCurrentUser() async {
    User currentUser;
    currentUser = await _auth.currentUser;
    return currentUser;
}
class MyApp extends StatelessWidget {
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'RedLink',
            home: //Login(),
            FutureBuilder(
                future: getCurrentUser(),
                builder: (context, snapshot) {
                    if (snapshot.hasData) {
                        return SplashScreen();
                    } else {
                        return SplashScreen();
                    }
                },
            ),
        );
    }
}