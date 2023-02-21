import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topicostarde/producto.dart';

Widget regresarProducto(Producto producto) {
  return Row(children: [
    Text(
      producto.codigo,
      style: GoogleFonts.lato(
        fontSize: 28,
      ),
    ),
    SizedBox(
      width: 20,
    ),
    Expanded(
      child: Text(
        producto.nombre,
        style: GoogleFonts.lato(
          fontSize: 28,
        ),
      ),
    ),
    SizedBox(
      width: 10,
    ),
    Text(
      producto.precio.toString(),
      style: GoogleFonts.lato(
        fontSize: 28,
      ),
    ),
  ]);
}
