import 'package:flutter/material.dart';

class HomeTask extends StatelessWidget {
  const HomeTask(this.title, this.duration);

  final String duration;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 8.0,
      ),
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: Text("bonjour"),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffcaeba7),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 24.0,
                  left: 20.0,
                  bottom: 24.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text(duration),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
