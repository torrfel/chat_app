import 'package:chat_app/controlador/autenticacion.dart';
import 'package:chat_app/interfaz/Sign_in/start.dart';
import 'package:chat_app/interfaz/chat.dart';
import 'package:chat_app/interfaz/chat/profile.dart';
import 'package:chat_app/interfaz/chat/sala_chat.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(//recive un flujo de informacion, unas variables de flujo 
      stream: Autenticacion().estadoLogin,//a las variabes de flujo hay que asignarles un cambio de estado basado en autenticacion
      builder: (context, respuesta){
        if(respuesta.hasData){//si respuesta trae informaicon
          return profile();
        } else {
          return profile();
        }
      }
    );
  }
}
