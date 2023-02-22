import 'package:flutter/material.dart';
import 'package:topicostarde/producto.dart';

class CrearProducto extends StatefulWidget {
  CrearProducto({Key? key}) : super(key: key);

  @override
  State<CrearProducto> createState() => _CrearProductoState();
}

class _CrearProductoState extends State<CrearProducto> {
  final TextEditingController codigoController = TextEditingController();

  final TextEditingController nombreController = TextEditingController();

  final TextEditingController precioController = TextEditingController();

  bool error_precio = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Producto'),
      ),
      body: Column(children: [
        TextField(
          controller: codigoController,
          decoration: const InputDecoration(
            hintText: 'Ingrese el código',
          ),
        ),
        TextField(
          controller: nombreController,
          decoration: const InputDecoration(
            hintText: 'Ingrese el nombre',
          ),
        ),
        TextField(
          controller: precioController,
          onChanged: (value) {
            if (value.contains('s')) {
              setState(() {
                error_precio = true;
              });
            } else {
              setState(() {
                error_precio = false;
              });
            }
          },
          decoration: InputDecoration(
            hintText: 'Ingrese el precio',
            errorText: error_precio ? 'Tengo ERROR' : null,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            var producto = Producto(
              codigo: codigoController.text,
              nombre: nombreController.text,
              precio: double.parse(precioController.text),
            );
            Navigator.pop(context, producto);
          },
          child: const Text('Guardar'),
        ),
      ]),
    );
  }
}
