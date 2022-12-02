import 'package:chat_app/controlador/autenticacion.dart';
import 'package:chat_app/interfaz/Sign_in/inicio_sesion.dart';
import 'package:flutter/material.dart';

class registrarse extends StatefulWidget {
  const registrarse({super.key});

  @override
  State<registrarse> createState() => _registrarseState();
}

class Route extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return inicio_sesion();
  }
}

class _registrarseState extends State<registrarse> {
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
                      'Sign Up',
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
                    decoration: InputDecoration(
                      hintText: 'User', 
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    controller: password,
                    decoration: InputDecoration(
                      hintText: 'Pasword',
                    ),
                  )
                ],
              ),
              ),

            ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 137, 77, 189),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Route()),
                );
              Autenticacion().CreateUser(email: email.text, password: password.text);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 60,
                right: 60,
                top: 15,
                bottom: 15
              ),
              child: const Text('Sign In'),
            ),
          ),
          ],
        ),
      )
    );
  }
}
