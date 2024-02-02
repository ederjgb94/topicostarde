import 'package:flutter/material.dart';

class AgregarProductoView extends StatelessWidget {
  AgregarProductoView({Key? key}) : super(key: key);
  final TextEditingController idcontroller = TextEditingController();
  final TextEditingController nombrecontroller = TextEditingController();
  final TextEditingController preciocontroller = TextEditingController();

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
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
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
