import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:topicostarde/producto.dart';

class CarritoPage extends StatefulWidget {
  @override
  State<CarritoPage> createState() => _CarritoPageState();
}

class _CarritoPageState extends State<CarritoPage> {
  final TextEditingController _codigoController = TextEditingController();

  final List<Producto> productos_carrito = [];

  @override
  Widget build(BuildContext context) {
    List<Producto> productos = Hive.box<Producto>('productos').values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 30,
                    ),
                    child: TextField(
                      controller: _codigoController,
                      decoration: InputDecoration(
                        labelText: 'Codigo',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: FloatingActionButton(
                    onPressed: () {
                      String codigo = _codigoController.text;
                      Producto producto = productos.firstWhere((producto) {
                        return producto.codigo == codigo;
                      });
                      bool yaestamiproducto =
                          productos_carrito.contains(producto);
                      if (yaestamiproducto) {
                        producto.cantidad++;
                        setState(() {});
                      } else {
                        productos_carrito.add(producto);
                        setState(() {});
                      }
                    },
                    child: Icon(
                      Icons.search,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: productos_carrito.map((producto) {
                return ListTile(
                  title: Text(producto.nombre),
                  leading: Text(producto.cantidad.toString()),
                  subtitle: Text(producto.precio.toString()),
                  trailing: Container(
                    height: 100,
                    width: 150,
                    child: Row(children: [
                      IconButton(
                        onPressed: () {
                          productos_carrito.remove(producto);
                          setState(() {});
                        },
                        icon: Icon(Icons.delete),
                      ),
                      IconButton(
                        onPressed: () {
                          producto.cantidad++;
                          setState(() {});
                        },
                        icon: Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () {
                          // producto.cantidad--;
                          setState(() {});
                        },
                        icon: Icon(Icons.remove),
                      ),
                    ]),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
