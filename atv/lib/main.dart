import 'package:flutter/material.dart';
import 'estil.dart';

List<String> titles = <String>[
  'Administração',
  'Cliente',
];

final List imgs = [];

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color.fromARGB(255, 54, 67, 75),
          useMaterial3: true),
      home: const SigHat(),
    );
  }
}

class SigHat extends StatefulWidget {
  const SigHat({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SigHatState createState() => _SigHatState();
}

class _SigHatState extends State<SigHat> {
  @override
  Widget build(BuildContext context) {
    const int tabsCount = 2;

    return DefaultTabController(
      initialIndex: 1,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SIG-HAT'),
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          scrolledUnderElevation: 4.0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(33, 150, 243, 0.6),
                  Color.fromRGBO(3, 169, 244, 0.9)
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
          
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: const Icon(Icons.admin_panel_settings),
                text: titles[0],
              ),
              Tab(
                icon: const Icon(Icons.people_alt),
                text: titles[1],
              ),
            ],
          ),
        ),

        body: const EstlFun(),

      ),
    );
  }
}

