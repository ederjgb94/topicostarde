import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:topicostarde/producto.dart';
import 'package:topicostarde/widgets/producto_widget.dart';

class VerProductosPage extends StatefulWidget {
  const VerProductosPage({
    super.key,
  });

  @override
  State<VerProductosPage> createState() => _VerProductosPageState();
}

class _VerProductosPageState extends State<VerProductosPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget textoInicio(Producto producto) {
    return Text(
      producto.nombre +
          '\n' +
          producto.codigo +
          '\n' +
          producto.precio.toString(),
      style: GoogleFonts.lato(
        fontSize: 18,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var box = Hive.box<Producto>('productos');
    var productos = box.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Ver Productos'),
      ),
      body: Container(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: productos
              .map(
                (producto) => regresarProducto(producto),
              )
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
