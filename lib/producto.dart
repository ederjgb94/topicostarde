import 'package:hive_flutter/hive_flutter.dart';

class Producto {
  String codigo;
  String nombre;
  double precio;

  Producto({
    required this.codigo,
    required this.nombre,
    required this.precio,
  }) {}

  @override
  String toString() {
    return 'Producto(codigo: $codigo, nombre: $nombre, precio: $precio)';
  }
}

class ProductoAdapter extends TypeAdapter<Producto> {
  @override
  final int typeId = 0;

  @override
  Producto read(BinaryReader reader) {
    return Producto(
      codigo: reader.read(0),
      nombre: reader.read(1),
      precio: reader.read(2),
    );
  }

  @override
  void write(BinaryWriter writer, Producto obj) {
    writer.write(obj.codigo);
    writer.write(obj.nombre);
    writer.write(obj.precio);
  }
}
