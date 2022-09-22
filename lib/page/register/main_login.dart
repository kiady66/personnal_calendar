import 'package:flutter/material.dart';
import 'package:personnal_calendar/service/AuthServices.dart';

class MainLogin extends StatefulWidget {
  const MainLogin({Key? key}) : super(key: key);

  @override
  State<MainLogin> createState() => _MainLoginState();
}

class _MainLoginState extends State<MainLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () async {
              await AuthServices().signInGoogle();
            },
            child: const Text("Google"),
          )
        ],
      ),
    );
  }
}
