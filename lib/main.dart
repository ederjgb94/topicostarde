import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topicostarde/producto.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<Producto> productos = [
    Producto(codigo: "001", nombre: "Coca Cola", precio: 1.5),
    Producto(codigo: "002", nombre: "Pepsi", precio: 1.5),
    Producto(codigo: "003", nombre: "Fanta", precio: 1.5),
    Producto(codigo: "004", nombre: "Sprite", precio: 1.5),
    Producto(codigo: "005", nombre: "Manaos", precio: 1.5),
    Producto(codigo: "006", nombre: "Seven up", precio: 1.5),
    Producto(codigo: "007", nombre: "Pepsi Light", precio: 1.5),
    Producto(codigo: "008", nombre: "Coca Cola Light", precio: 1.5),
    Producto(codigo: "009", nombre: "Fanta Naranja", precio: 1.5),
    Producto(codigo: "010", nombre: "Fanta Limon", precio: 1.5),
    Producto(codigo: "011", nombre: "Fanta Uva", precio: 1.5),
  ];

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: productos
              .map(
                (producto) => textoInicio(producto),
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

dynamic algo(e) {
  return null;
}
