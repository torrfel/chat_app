import 'package:chat_app/controlador/autenticacion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class escritura extends StatefulWidget {
  const escritura({super.key});

  @override
  State<escritura> createState() => _escrituraState();
}

final mensaje = TextEditingController();
final fire = FirebaseFirestore.instance;
final foco = FocusNode();

class _escrituraState extends State<escritura> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
          margin: EdgeInsets.only(top: 460),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
              
          ),
          child: Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(30)
              
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: mensaje,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type here...'
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
                      onPressed: () {
                        if (mensaje.text.isNotEmpty){
                          fire.collection('Chat').doc().set({
                            'mensaje': mensaje.text,
                            'tiempo': DateTime.now(),
                            'email': ((Autenticacion().usuarios?.email).toString())
                          });
                          mensaje.clear();
                        } 
                      }, 
                      icon: Icon(Icons.send))
                  ],
                ),
              ),)
          ),
        ),
    
      ],
        
      ),
    );
  }
}