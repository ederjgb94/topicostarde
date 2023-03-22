import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Producto extends HiveObject {
  @HiveField(0)
  String codigo;
  @HiveField(1)
  String nombre;
  @HiveField(2)
  double precio;

  int cantidad = 0;

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
      codigo: reader.read(),
      nombre: reader.read(),
      precio: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Producto obj) {
    writer.write(obj.codigo);
    writer.write(obj.nombre);
    writer.write(obj.precio);
  }
}
