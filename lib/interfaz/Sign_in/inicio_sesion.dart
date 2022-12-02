import 'package:chat_app/controlador/autenticacion.dart';
import 'package:chat_app/interfaz/Sign_in/registrarse.dart';
import 'package:chat_app/interfaz/chat.dart';
import 'package:chat_app/interfaz/home.dart';
import 'package:flutter/material.dart';

class inicio_sesion extends StatefulWidget {
  const inicio_sesion({super.key});

  @override
  State<inicio_sesion> createState() => _inicio_sesionState();
}



class Route extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return registrarse();
  }
}

class register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class _inicio_sesionState extends State<inicio_sesion> {
  final email  = TextEditingController();
  final password = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 50,
                right: 50,
                top:80,
                bottom: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Create on account, it´s free',
                      style: TextStyle(
                        color: Colors.black38
                      ),),
                  )
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(
                left: 40,
                right: 40,
                top: 10,
                bottom: 70
              ),
              child: Column(
                children: [
                  TextField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: 'Email', 
                    ),
                  ),
                  TextField(
                    
                    obscureText: true,
                    controller: password ,
                    decoration: InputDecoration(
                      hintText: 'Password', 
                    ),
                  ),
                  
                ],
              ),
              ),

            ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 137, 77, 189),
            ),
            onPressed: () {    
               Autenticacion().SignIn(email: email.text, password: password.text);  
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => register()),
                );
              
                       
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 60,
                right: 60,
                top: 15,
                bottom: 15
              ),
              child: const Text('Log In'),
            ),
          ),

          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Route()),
                );
              }, 
              child: Text(
                'no tengo cuenta aun',
                style: TextStyle(
                  fontSize: 15,
                ),))
          ],
        ),
      )
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return chat();
  }
}
