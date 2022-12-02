import 'package:chat_app/interfaz/sala.dart';
import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}
class RouteSala extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return sala();
  }
}
class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    final button_call = IconButton(
      onPressed: () {
        print('object1');
      }, 
      icon: Icon(Icons.phone));

    final button_regresar = IconButton(
      onPressed: () {
        print('object');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RouteSala()),
        );
      }, 
      icon: Icon(Icons.arrow_back)); 

    final name_user = Container(
      margin: EdgeInsets.only(
        right: 30
      ),
      child: Text(
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal
        ),
        'Sebastian Rudiger'),
    ); 

    final photo = Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: 10),
      
      width: 40,
      decoration: BoxDecoration(
        
        shape: BoxShape.circle,
        image: DecorationImage(
          
          fit: BoxFit.cover,
          image: NetworkImage('https://i.pinimg.com/564x/73/6d/1f/736d1fc1ab7b2c861e1875bef5bd2592.jpg'))
      )
    );

    final AppBar_relleno = Row(
      children: [
        button_regresar,
        photo,
        name_user,
        button_call

      ],
    );
    
    final AppBar =  Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)
            )
          
          ),
          child: AppBar_relleno,
          height: 70,
        ),
        
      ],
    );

    return  AppBar;
    
  }
}