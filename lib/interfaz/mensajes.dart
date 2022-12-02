import 'package:chat_app/controlador/autenticacion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class mensajes extends StatefulWidget {
  const mensajes({super.key});

  @override
  State<mensajes> createState() => _mensajesState();
}
Stream<QuerySnapshot> resp_consulta = FirebaseFirestore.instance
  .collection("Chat")
  .orderBy("tiempo",descending: true)
  .snapshots();

class _mensajesState extends State<mensajes> {

  @override
  void initState() {
      super.initState();
      test();
  }

  void test() async{
    print(  FirebaseFirestore.instance
  .collection("Chat")
  .snapshots());
  }
  

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: resp_consulta,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> respuesta){
        return respuesta.data?.docs.isEmpty == false
        ? ListView.builder(
          itemCount: respuesta.data!.docs.length,
          itemBuilder: (BuildContext context, int index) {
            return 
              Card(
                margin: (Autenticacion().usuarios?.email.toString() == 
                    respuesta.data!.docs[index]
                        .get('email')
                        .toString()
                    ? EdgeInsets.only(
                      right: 10,
                      left: 70,
                      top: 10)
                    : EdgeInsets.only(
                      left: 10,
                      right: 70,
                      top: 10)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: 
                   (Autenticacion().usuarios?.email.toString() == 
                    respuesta.data!.docs[index]
                        .get('email')
                        .toString()
                    ? Color.fromARGB(255, 137, 77, 189)
                    : Colors.white),
                child: ListTile(
                  title: Text(
                    respuesta.data?.docs[index].get("mensaje"),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                    ),
                    textAlign: (Autenticacion().usuarios?.email.toString() == 
                    respuesta.data!.docs[index].get('email')
                      ? TextAlign.right
                      : TextAlign.left)
                  ),
                  

                  onTap: (){   
                    Alert(
                      type: AlertType.info,
                      context: context, 
                      title: "sala pribada", 
                      desc: "quieres chatear con el usuario en una sala privada ?",
                      buttons: [
                        DialogButton(
                          child: Text('si'), 
                          onPressed: () {
                            Navigator.pop(context);
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (respuesta){
                                return Container(
                                  child: Column(
                                    children: [
                                      AppBar(
                                        title: Text('chat privado'),
                                      ),
                                      Text('mensajes cargados de lista privada')
                                    ],
                                  ),);
                              });
                          },),

                        DialogButton(
                          child: Text('NO'), 
                          onPressed: () {
                            Navigator.pop(context);
                          },)
                      ])

                    .show();
                  },
                  ),

                );
            },
          )

        :Center(
          child: CircularProgressIndicator(),
        );
        
      }

      );
  }
}