import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _cont = 0;

  void increment() {
    setState(() {
      _cont++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        flexibleSpace: Container(
          color: Colors.red,
          child: Image.asset(
            'assets/imagen.png',
            fit: BoxFit.cover,
          ),
        ),
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome!',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff384B70),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Email'),
              ),
              const TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Enter your email'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Password'),
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Forgot Passowrd?'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Login'),
              ),
              Row(
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
