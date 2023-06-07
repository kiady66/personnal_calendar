import 'package:daylean_app/daylean_api/api.dart';
import 'package:daylean_app/widget/task_list_item.dart';
import 'package:flutter/material.dart';

class HomeSubjects extends StatefulWidget {
  const HomeSubjects({Key? key}) : super(key: key);

  @override
  State<HomeSubjects> createState() => _HomeSubjectsState();
}

class _HomeSubjectsState extends State<HomeSubjects> {

  List<Map<String, dynamic>> tasksList = [];

  Future<bool> fetchData() async {
    final response = await Api.getSubjectList();
    if (mounted) {
      setState(() {
      tasksList = response;
    });
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
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
              child: ListView.builder(itemCount: tasksList.length, itemBuilder: (context, index) {
                return TaskListItem(id: tasksList[index]['id'], title: tasksList[index]['title'], description: tasksList[index]['description']);
              }))
        ],
      ),
    );
  }
}
