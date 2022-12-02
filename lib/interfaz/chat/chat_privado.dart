
import 'package:chat_app/interfaz/chat/escritura.dart';
import 'package:chat_app/interfaz/chat/profile.dart';
import 'package:chat_app/interfaz/chat/sala_chat.dart';
import 'package:flutter/material.dart';

class chatPrivado extends StatefulWidget {
  const chatPrivado({super.key});

  @override
  State<chatPrivado> createState() => _chatPrivadoState();
}

class _chatPrivadoState extends State<chatPrivado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
            children: [
                salaChat(),
                profile(),
                escritura(),
            ],
          ) 
      
    );
  }
}