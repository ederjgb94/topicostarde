import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VerUsuarios extends StatelessWidget {
  const VerUsuarios({Key? key}) : super(key: key);

  Future<List> _getUsuarios() async {
    var db = FirebaseFirestore.instance;
    var usuarios =
        await db.collection('users').orderBy('first', descending: true).get();

    return usuarios.docs.map((document) => document.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Usuarios')),
      body: Center(
        child: FutureBuilder(
            future: _getUsuarios(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        snapshot.data![index]['first'],
                      ),
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
