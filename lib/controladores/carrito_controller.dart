import 'dart:math';

import 'package:topicostarde/modelos/producto_model.dart';

class CarritoController {
  List<Producto> productos = [];

  void agregarProducto({
    required String id,
    required String nombre,
    required double precio,
  }) {
    productos.add(Producto(
      id: id,
      nombre: nombre,
      precio: precio,
    ));
  }

  List<Producto> obtenerProductos() {
    return productos;
  }

  void eliminarProducto(Producto producto) {
    productos.remove(producto);
  }

  void addRandomProduct() {
    List<String> nombres = [
      'Coca-cola',
      'Fanta',
      'Sprite',
      'Agua',
      'Cerveza',
      'Vino',
      'Whisky',
      'Ron',
      'Ginebra',
      'Vodka',
      'Tequila',
      'Brandy',
      'Café',
      'Té',
    ];

    productos.add(Producto(
      id: Random().nextInt(100).toString(),
      nombre: nombres[Random().nextInt(nombres.length)],
      precio: double.parse(
        (Random().nextDouble() * 100).toStringAsFixed(2),
      ),
    ));
  }
}
