import 'package:chat_app/controlador/autenticacion.dart';
import 'package:chat_app/interfaz/Sign_in/start.dart';
import 'package:chat_app/interfaz/chat.dart';
import 'package:chat_app/interfaz/login.dart';
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

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
          return start();
        } else {
          return start();
        }
      }
    );
  }
}
