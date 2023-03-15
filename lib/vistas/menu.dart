import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:topicostarde/producto.dart';
import 'package:topicostarde/vistas/crear_producto.dart';
import 'package:topicostarde/vistas/ver_productos.dart';

class MenuPage extends StatelessWidget {
  MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<Producto>('productos');

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) {
                      return CrearProducto();
                    },
                  ),
                ).then((value) {
                  if (value != null) {
                    Producto producto = value;
                    box.add(producto);
                  }
                });
              },
              child: Text(
                'Crear Producto',
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink.shade300,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) {
                      return VerProductosPage();
                    },
                  ),
                );
              },
              child: Text(
                'Ver Producto',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
