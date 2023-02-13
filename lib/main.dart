import 'package:flutter/material.dart';

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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 5,
                  ),
                  height: 80,
                  width: 80,
                  color: Colors.orange,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    left: 5,
                    right: 10,
                  ),
                  height: 80,
                  width: 80,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  height: 80,
                  color: Colors.pink,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                  right: 5,
                ),
                height: 80,
                width: (size.width - 40) / 3,
                color: Colors.teal,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 5,
                  right: 5,
                ),
                height: 80,
                width: (size.width - 40) / 3,
                color: Colors.blue,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 5,
                  right: 10,
                ),
                height: 80,
                width: (size.width - 40) / 3,
                color: Colors.yellow,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
