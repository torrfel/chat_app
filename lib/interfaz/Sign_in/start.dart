import 'package:chat_app/interfaz/Sign_in/inicio_sesion.dart';
import 'package:chat_app/interfaz/Sign_in/registrarse.dart';
import 'package:flutter/material.dart';

class start extends StatefulWidget {
  const start({super.key});

  @override
  State<start> createState() => _startState();
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return inicio_sesion();
  }
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return registrarse();
  }
}

class _startState extends State<start> {
  @override
  Widget build(BuildContext context) {
    return  Material(
      type: MaterialType.transparency,
      child: Container(
        child: Column(
          children: [
            Image.network(
              'https://img.freepik.com/vector-premium/trabajo-equipo-reunion-negocios-isometrica-gente-hablando-proyecto-mesa-o-proceso-trabajo-ilustracion-vector-lluvia-ideas-reunion-trabajo-equipo-negocios-gente-conversacion-3d-oficina_53562-13141.jpg',
              height: 300,),
              
            Center(
              
              child: Container(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20
                ),
                child: Text(
                  'Enjoy the new experience of chating with global friends',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
              ),
            ),
            Center(
              
              child: Container(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20
                ),
                child: Text(
                  'Connect people arround the wold for free',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 63, 57, 57),
                    fontSize: 15
                  ),
                  ),
              
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 30,
                bottom: 10),
              
              child: ElevatedButton(
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 60,
                      right: 60,
                      top: 15,
                      bottom: 15
                    ),
                    child: Text(
                      'Get Satarted'),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 137, 77, 189),
                    // side: BorderSide(color: Colors.yellow, width: 5),
                    textStyle: const TextStyle(
                        color: Colors.white, fontSize: 15 , fontStyle: FontStyle.normal),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                        
                    
    
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FirstRoute()),
                    );
                  },
              ),
            ),
            
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              }, 
              child: Text(
                'ya tengo cuenta',
                style: TextStyle(
                  fontSize: 15,
                ),))
    
            
          ],
        ),
        
      ),
    );
  }
}