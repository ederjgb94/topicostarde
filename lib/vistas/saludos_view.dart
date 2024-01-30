import 'package:flutter/material.dart';
import 'package:topicostarde/widgets/custom_button_home.dart';

class SaludosView extends StatelessWidget {
  const SaludosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saludos'),
      ),
      body: Center(
        child: CustomButtonHome(
          name: 'Regresar',
          color: Colors.teal,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
