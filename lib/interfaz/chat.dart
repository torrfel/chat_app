import 'package:chat_app/controlador/autenticacion.dart';
import 'package:chat_app/interfaz/mensajes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

final mensaje = TextEditingController();
final fire = FirebaseFirestore.instance;
final foco = FocusNode();

class _chatState extends State<chat> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              padding: EdgeInsets.all(20),
              onPressed: () {
                Autenticacion().SignOut();
              },
              
              icon: Icon(Icons.exit_to_app), 
              
            ),
            Text((Autenticacion().usuarios?.email).toString()),
          ],
        ),
      ),

      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                
                child: TextField(
                  focusNode: foco,
                  controller: mensaje,
                  decoration: InputDecoration(
                    hintText: 'Mensaje'
                  ),

                onSubmitted: (value) {
                  foco.requestFocus();
                  if (mensaje.text.isNotEmpty){
                    mensaje.text = value;
                    fire.collection('Chat').doc().set({
                      "mensaje": mensaje.text,
                      "tiempo": DateTime.now(),
                      "email": (Autenticacion().usuarios?.email).toString()
                    });
                    mensaje.clear();
                  }
                },
                ),
              ),
              IconButton(
                onPressed: (){

                  if (mensaje.text.isNotEmpty){
                    fire.collection('Chat').doc().set({
                      "mensaje": mensaje.text,
                      "tiempo": DateTime.now(),
                      "email": (Autenticacion().usuarios?.email).toString()
                    });
                    mensaje.clear();
                  }
                }, 
                icon: Icon(Icons.send))
            ],
          ),
          Container(
            child: Expanded(child: mensajes()),
          )
        ],
      ),
    );
  }
}