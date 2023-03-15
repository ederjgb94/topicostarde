import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:topicostarde/producto.dart';
import 'package:topicostarde/vistas/menu.dart';
import 'package:topicostarde/vistas/ver_productos.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductoAdapter());
  var box = await Hive.openBox<Producto>('productos');

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
      home: MenuPage(),
    );
  }
}
