import 'package:flutter/material.dart';
import 'package:googlesign/homepage.dart';
import 'package:googlesign/share.dart';
import 'package:googlesign/signup.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // initializing the firebase app
  runApp(GoogleSignIn()); // calling runApp
}

// google signin stateful widget
class GoogleSignIn extends StatefulWidget {
  GoogleSignIn({Key? key}) : super(key: key);
  @override
  _GoogleSignInState createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {
  var islogin;

  checkUserLoginState() async {
    await Shared.getUserSharedPrefernces().then((value) {
      setState(() {
        islogin = value;
      });
    });
  }

  @override
  void initState() {
    checkUserLoginState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GEEKS FOR GEEKS',
      debugShowCheckedModeBanner:
          false, // debug banner false that is show on corner
      theme: ThemeData(
        primarySwatch: Colors.cyan, // color to our app
      ),
      home: islogin != null
          ? islogin
              ? HomePage()
              : SignInScreen()
          : SignInScreen(),
    );
  }
}
