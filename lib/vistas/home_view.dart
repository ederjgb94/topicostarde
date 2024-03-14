import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:topicostarde/modelos/producto_model.dart';
import 'package:topicostarde/vistas/agregar_producto_view.dart';
import 'package:topicostarde/vistas/saludos_view.dart';
import 'package:topicostarde/vistas/ver_productos_view.dart';
import 'package:topicostarde/vistas/ver_usuarios_view.dart';
import 'package:topicostarde/widgets/custom_button_home.dart';

class HomeView extends StatelessWidget {
  List<Producto> productos = [
    Producto(
      id: '1',
      nombre: 'Coca-cola',
      precio: 1.5,
    ),
    Producto(
      id: '2',
      nombre: 'Fanta',
      precio: 1.5,
    ),
    Producto(
      id: '3',
      nombre: 'Sprite',
      precio: 1.5,
    ),
  ];
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtonHome(
              name: 'Ver Productos',
              color: Colors.green,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return VerProductosView(
                        productos: productos,
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            CustomButtonHome(
              name: 'Agregar Productos',
              color: Colors.green,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AgregarProductoView(
                        productos: productos,
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            CustomButtonHome(
              name: 'Test Hive',
              color: Colors.blue,
              onPressed: () {
                var productosBox = Hive.box('productos');
                print('Productos: ${productosBox.values}');
              },
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButtonHome(
              name: 'Probando Firebase',
              color: Colors.blue,
              onPressed: () {
                var db = FirebaseFirestore.instance;
                var faker = Faker();

                // Create a new user with a first and last name
                final user = <String, dynamic>{
                  "first": faker.person.firstName(),
                  "last": faker.person.lastName(),
                  "born": faker.date.year(),
                };

// Add a new document with a generated ID
                db.collection("users").add(user).then((DocumentReference doc) =>
                    print('DocumentSnapshot added with ID: ${doc.id}'));
              },
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButtonHome(
              name: 'Ver Usuarios',
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const VerUsuarios();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
