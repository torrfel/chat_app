import 'package:chat_app/interfaz/chat/chat_privado.dart';
import 'package:flutter/material.dart';

class sala extends StatefulWidget {
  const sala({super.key});

  @override
  State<sala> createState() => _salaState();
}
class Route extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return chatPrivado();
  }
}

class _salaState extends State<sala> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: IconButton(
          icon: Icon(Icons.golf_course),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Route()),
            );
          },),
      ),
    );
  }
}