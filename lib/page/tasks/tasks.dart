import 'package:flutter/material.dart';

import '../home_page/components/home_task.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("https://shotkit.com/wp-content/uploads/2021/06/cool-profile-pic-matheus-ferrero.jpeg"),
                          )),
                    )),
                    const Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Bonjour Kiady!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 6,
              child: ListView(
                children: const [
                  HomeTask(
                    'LMS tecnical support',
                    '45 min',
                  ),
                  HomeTask(
                    'LMS tecnical support',
                    '45 min',
                  ),
                  HomeTask(
                    'LMS tecnical support',
                    '45 min',
                  ),
                  HomeTask(
                    'LMS tecnical support',
                    '45 min',
                  ),
                  HomeTask(
                    'LMS tecnical support',
                    '45 min',
                  ),
                  HomeTask(
                    'LMS tecnical support',
                    '45 min',
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
