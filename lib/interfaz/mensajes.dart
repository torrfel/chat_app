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
                color: 
                   (Autenticacion().usuarios?.email.toString() == 
                    respuesta.data!.docs[index]
                        .get('email')
                        .toString()
                    ? Colors.grey
                    : Colors.green),
                child: ListTile(
                  title: Text(
                    respuesta.data?.docs[index].get("mensaje"),
                    textAlign: (Autenticacion().usuarios?.email.toString() == 
                    respuesta.data!.docs[index].get('email')
                      ? TextAlign.right
                      : TextAlign.left)
                  ),
                  subtitle: Text(respuesta.data?.docs[index].get("email"),
                  textAlign: (Autenticacion().usuarios?.email).toString() == 
                    respuesta.data!.docs[index].get('email')
                      ? TextAlign.right
                      : TextAlign.left),

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