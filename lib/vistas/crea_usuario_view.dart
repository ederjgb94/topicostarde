import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CrearUsuarioView extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController bornController = TextEditingController();
  CrearUsuarioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Usuario'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Text('FirstName'),
              TextField(
                controller: firstNameController,
              ),
              const Text('LastName'),
              TextField(
                controller: lastNameController,
              ),
              const Text('Born'),
              TextField(
                controller: bornController,
              ),
              ElevatedButton(
                onPressed: () async {
                  var db = FirebaseFirestore.instance;
                  db.collection('users').add({
                    'first': firstNameController.text,
                    'last': lastNameController.text,
                    'born': bornController.text,
                  });
                  FocusManager.instance.primaryFocus?.unfocus();
                  Future.delayed(const Duration(milliseconds: 300), () {
                    Navigator.pop(context);
                  });
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
