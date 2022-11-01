import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:personnal_calendar/firebase_options.dart';
import 'package:personnal_calendar/page/home_page/home_page.dart';
import 'package:personnal_calendar/page/register/main_login.dart';
import 'package:personnal_calendar/view/tasks_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // application ID android : "1:843320279296:android:24c88b97bd4753464b33e5"
  // application ID ios : "1:843320279296:ios:b4d54e39cf3fb6b34b33e5"
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/bloc': (context) => const TasksPage(),
      },
    );
  }
}

Future<void> makePostRequest(idToken) async {
  final url = Uri.parse("0test");
  final headers = {"Content-type": "application/json"};
  final json = '{ "id_token": ' + '"' + idToken + '"' + '}';
  final response = await post(url, headers: headers, body: json);
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //FirebaseAuth.instance.currentUser?.getIdToken().then((value) => {makePostRequest(value)});

    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          } else if (snapshot.hasData) {
            var token = FirebaseAuth.instance.currentUser?.getIdTokenResult();
            return const HomePage(title: 'Kiady');
          } else {
            return const MainLogin();
          }
        },
      ),
    );
  }
}
