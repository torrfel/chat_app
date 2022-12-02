import 'package:chat_app/interfaz/mensajes.dart';
import 'package:flutter/material.dart';

class salaChat extends StatelessWidget {
  const salaChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 60
      ),
      decoration: BoxDecoration(color: Colors.grey),
      child: Expanded(child: mensajes()),
    );
  }
}