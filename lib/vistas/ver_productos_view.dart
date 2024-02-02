import 'package:flutter/material.dart';
import 'package:topicostarde/modelos/producto_model.dart';

class VerProductosView extends StatelessWidget {
  final List<Producto> productos;
  const VerProductosView({
    Key? key,
    required this.productos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ver productos')),
      body: Column(
        children: productos
            .map(
              (Producto producto) => ListTile(
                leading: CircleAvatar(
                  child: Text(producto.id),
                ),
                title: Text(producto.nombre),
                subtitle: Text(producto.precio.toString()),
              ),
            )
            .toList(),
      ),
    );
  }
}
