import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  int _cont = 0;
  bool _isRed = true;
  int delayed = 500;

  void increment() {
    setState(() {
      _cont++;
    });
  }

  void changeColor() {
    setState(() {
      _isRed = !_isRed;
    });
  }

  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 22.0,
                ),
                SizedBox(height: 16.0),
                DelayedDisplay(
                  child: Text(
                    "Hello, John Doe",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.home, size: 20.0, color: Colors.white),
            title: const Text("Home"),
            textColor: Colors.white,
            dense: true,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.verified_user,
                size: 20.0, color: Colors.white),
            title: const Text("Profile"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.monetization_on,
                size: 20.0, color: Colors.white),
            title: const Text("Wallet"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.shopping_cart,
                size: 20.0, color: Colors.white),
            title: const Text("Cart"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading:
                const Icon(Icons.star_border, size: 20.0, color: Colors.white),
            title: const Text("Favorites"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading:
                const Icon(Icons.settings, size: 20.0, color: Colors.white),
            title: const Text("Settings"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }

  toggleMenu([bool end = false]) {
    if (end) {
      final state = _endSideMenuKey.currentState!;
      if (state.isOpened) {
        state.closeSideMenu();
      } else {
        state.openSideMenu();
      }
    } else {
      final state = _sideMenuKey.currentState!;
      if (state.isOpened) {
        state.closeSideMenu();
      } else {
        state.openSideMenu();
      }
    }
  }

  Widget linea() => Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                print('hola');
              },
              child: Container(
                color: Colors.blue.shade100,
                height: 200,
                child: const Center(
                  child: Text(
                    'Seleccionar Categorias',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 200,
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: _sideMenuKey,
      menu: buildMenu(),
      type: SideMenuType.slideNRotate,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              toggleMenu();
            },
          ),
          // toolbarHeight: 200,
          // flexibleSpace: Container(
          //   color: Colors.red,
          //   child: Image.asset(
          //     'assets/imagen.png',
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // backgroundColor: Colors.transparent,
          // systemOverlayStyle: const SystemUiOverlayStyle(
          //   statusBarColor: Colors.transparent,
          //   statusBarIconBrightness: Brightness.dark,
          // ),
          // elevation: 0,
        ),
        body: Container(
          child: Column(
            children: [
              linea(),
              linea(),
              linea(),
            ],
          ),
        ),
      ),
    );
  }
}
