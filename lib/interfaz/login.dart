import 'package:chat_app/controlador/autenticacion.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final email  = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login / register'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(
                hintText: 'Email', suffixIcon: Icon(Icons.mail)
                ),
            ),
            TextField(
              obscureText: true,
              controller: password        ,
              decoration: InputDecoration(
                hintText: 'Email', suffixIcon: Icon(Icons.password)
                
                ),
            ),

            Divider(),

            ElevatedButton.icon(
              onPressed: () {
                Autenticacion().SignIn(email: email.text, password: password.text);
              },
              icon: Icon(Icons.login), 
              label: Text('iniciar Sesión'),
            ),

            Divider(),

            ElevatedButton.icon(
              onPressed: () {
                Autenticacion().CreateUser(email: email.text, password: password.text);
              },
              
              icon: Icon(Icons.app_registration), 
              label: Text('registrar usuario'),
            )
          ],
        ),
      ),
    );
  }
}