import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VerUsuarios extends StatelessWidget {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController bornController = TextEditingController();
  VerUsuarios({Key? key}) : super(key: key);

  Future<List> _getUsuarios() async {
    var db = FirebaseFirestore.instance;
    var usuarios =
        await db.collection('users').orderBy('first', descending: true).get();

    return usuarios.docs.map((document) => document.data()).toList();
  }

  //leer usuarios en forma de stream
  Stream<QuerySnapshot> _getUsuariosStream() {
    var db = FirebaseFirestore.instance;
    return db.collection('users').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Usuarios')),
      body: Center(
        child: StreamBuilder(
          stream: _getUsuariosStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      snapshot.data!.docs[index]['first'],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Editar Usuario'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        const Text('FirstName'),
                                        TextField(
                                          controller: firstNameController
                                            ..text = snapshot.data!.docs[index]
                                                ['first'],
                                          // controller: firstNameController =
                                          //     TextEditingController(
                                          //         text: snapshot.data!
                                          //             .docs[index]['first']),
                                        ),
                                        const Text('LastName'),
                                        TextField(
                                          controller: lastNameController
                                            ..text = snapshot.data!.docs[index]
                                                ['last'],
                                        ),
                                        const Text('Born'),
                                        TextField(
                                          controller: bornController
                                            ..text = snapshot.data!.docs[index]
                                                ['born'],
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        var db = FirebaseFirestore.instance;
                                        db
                                            .collection('users')
                                            .doc(snapshot.data!.docs[index].id)
                                            .update({
                                          'first': firstNameController.text,
                                          'last': lastNameController.text,
                                          'born': bornController.text,
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Guardar'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            var db = FirebaseFirestore.instance;
                            db
                                .collection('users')
                                .doc(snapshot.data!.docs[index].id)
                                .delete();
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
        // child: FutureBuilder(
        //     future: _getUsuarios(),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const CircularProgressIndicator();
        //       } else {
        //         return ListView.builder(
        //           itemCount: snapshot.data?.length,
        //           itemBuilder: (context, index) {
        //             return ListTile(
        //               title: Text(
        //                 snapshot.data![index]['first'],
        //               ),
        //             );
        //           },
        //         );
        //       }
        //     }),
      ),
    );
  }
}
