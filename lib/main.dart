import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:personnal_calendar/page/home_page/home_page.dart';
import 'package:personnal_calendar/page/register/main_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDSWmIugRCEAb0kEaZO0EefJv6HZYIN_AI",
        appId: "1:843320279296:android:24c88b97bd4753464b33e5",
        messagingSenderId: "843320279296",
        projectId: "kiady-42e8c"),
  );
  //FirebaseAuth.instance.signOut();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const MainPage(),
    );
  }
}

Future<void> makePostRequest(idToken) async {
  final url = Uri.parse("http://10.0.2.2:3000/test");
  final headers = {"Content-type": "application/json"};
  final json = '{ "id_token": ' + '"' + idToken + '"' + '}';
  final response = await post(url, headers: headers, body: json);
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //FirebaseAuth.instance.currentUser?.getIdToken().then((value) => {makePostRequest(value)});

    return Scaffold(body: Container());
  }
}
