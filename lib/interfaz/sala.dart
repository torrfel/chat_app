import 'package:flutter/material.dart';

class sala extends StatefulWidget {
  const sala({super.key});

  @override
  State<sala> createState() => _salaState();
}

class _salaState extends State<sala> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Text(
              'data'),
          );
        },
      ),
    );
  }
}