import 'package:hive_flutter/hive_flutter.dart';
import 'package:topicostarde/modelos/producto_model.dart';

class VerProductosController {
  List<Producto> verProductos() {
    var productos = Hive.box('productos');
    if (productos.isNotEmpty) {
      List<Producto> listaProductos = [];
      for (var i = 0; i < productos.length; i++) {
        listaProductos.add(
          Producto(
            id: productos.getAt(i)['id'],
            nombre: productos.getAt(i)['nombre'],
            precio: double.parse(productos.getAt(i)['precio']),
          ),
        );
      }
      return listaProductos;
    }
    return [];
  }
}
