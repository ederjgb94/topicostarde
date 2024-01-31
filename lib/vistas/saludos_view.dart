import 'package:flutter/material.dart';
import 'package:topicostarde/controladores/carrito_controller.dart';
import 'package:topicostarde/widgets/custom_button_home.dart';

class SaludosView extends StatefulWidget {
  const SaludosView({super.key});

  @override
  State<SaludosView> createState() => _SaludosViewState();
}

class _SaludosViewState extends State<SaludosView> {
  final CarritoController carritoController = CarritoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito'),
      ),
      body: Column(
        children: [
          for (var producto in carritoController.obtenerProductos())
            ListTile(
              title: Text(producto.nombre),
              subtitle: Text(producto.precio.toString()),
              leading: CircleAvatar(
                child: Text(producto.id),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  carritoController.eliminarProducto(producto);
                  setState(() {});
                },
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          carritoController.addRandomProduct();
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
