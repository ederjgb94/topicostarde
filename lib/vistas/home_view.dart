import 'package:flutter/material.dart';
import 'package:topicostarde/vistas/saludos_view.dart';
import 'package:topicostarde/widgets/custom_button_home.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: CustomButtonHome(
          name: 'Ir a página 2',
          color: Colors.green,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SaludosView();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
