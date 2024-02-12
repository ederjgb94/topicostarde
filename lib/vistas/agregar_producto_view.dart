import 'package:flutter/material.dart';
import 'package:topicostarde/controladores/agregar_productos_controller.dart';
import 'package:topicostarde/modelos/producto_model.dart';

class AgregarProductoView extends StatelessWidget {
  final List<Producto> productos;
  AgregarProductoView({Key? key, required this.productos}) : super(key: key);
  final TextEditingController idcontroller = TextEditingController();
  final TextEditingController nombrecontroller = TextEditingController();
  final TextEditingController preciocontroller = TextEditingController();
  final AgregarProductosController agregarProductosController =
      AgregarProductosController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar producto')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('ID'),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: idcontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Nombre'),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: nombrecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Precio'),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: preciocontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // final Producto producto = Producto(
                  //   id: idcontroller.text,
                  //   nombre: nombrecontroller.text,
                  //   precio: double.parse(preciocontroller.text),
                  // );
                  // productos.add(producto);
                  agregarProductosController.agregarProducto(
                    id: idcontroller.text,
                    nombre: nombrecontroller.text,
                    precio: preciocontroller.text,
                  );
                  Navigator.pop(context);
                },
                child: const Text(
                  'Agregar Producto',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
