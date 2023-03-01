import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:topicostarde/producto.dart';
import 'package:topicostarde/vistas/menu.dart';
import 'package:topicostarde/vistas/ver_productos.dart';

void main() async {
  runApp(const MyApp());

  await Hive.initFlutter();
  var box = await Hive.openBox('testBox');

  box.put('producto', {
    'nombre': 'Coca Cola',
    'precio': 10.10,
    'algo': {
      'foo': 'bar',
      'Zar': 20,
      'arr': ['A', 'B'],
      'location': {
        'city': 'Tucson',
        'state': 'AZ',
      },
    },
    'cantidad': 10,
    'descripcion': 'Bebida gaseosa',
  });

  var producto = box.get('producto');
  print(producto['algo']['arr'][1]);
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
