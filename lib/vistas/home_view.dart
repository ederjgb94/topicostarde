import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:topicostarde/modelos/producto_model.dart';
import 'package:topicostarde/vistas/agregar_producto_view.dart';
import 'package:topicostarde/vistas/saludos_view.dart';
import 'package:topicostarde/vistas/ver_productos_view.dart';
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
              onPressed: () async {
                await Hive.initFlutter();
                await Hive.openBox('myBox');

                var box = Hive.box('myBox');

                box.put('name', 'David');

                var name = box.get('name');

                print('Name: $name');
              },
            ),
          ],
        ),
      ),
    );
  }
}
