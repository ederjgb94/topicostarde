import 'package:flutter/material.dart';
import 'package:topicostarde/producto.dart';
import 'package:topicostarde/vistas/crear_producto.dart';
import 'package:topicostarde/vistas/ver_productos.dart';

class MenuPage extends StatelessWidget {
  MenuPage({super.key});

  List<Producto> productos = [
    Producto(codigo: "001", nombre: "Coca Cola", precio: 4.5),
    Producto(codigo: "002", nombre: "Pepsi", precio: 10.5),
    Producto(codigo: "003", nombre: "Fanta", precio: 102.5),
    Producto(codigo: "004", nombre: "Sprite", precio: 144.5),
    Producto(codigo: "005", nombre: "Manaos", precio: 211.5),
    Producto(codigo: "006", nombre: "Seven up", precio: 231.5),
    Producto(codigo: "007", nombre: "Pepsi Light", precio: 11.5),
    Producto(codigo: "008", nombre: "Coca Cola Light", precio: 81.5),
    Producto(codigo: "009", nombre: "Fanta Naranja", precio: 71.5),
    Producto(codigo: "010", nombre: "Fanta Limon", precio: 61.5),
    Producto(codigo: "011", nombre: "Fanta Uva", precio: 771.5),
  ];

  @override
  Widget build(BuildContext context) {
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
                    productos.add(producto);
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
                      return VerProductosPage(
                        productos: productos,
                      );
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
