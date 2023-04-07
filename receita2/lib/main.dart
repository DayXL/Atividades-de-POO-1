import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color.fromARGB(255, 54, 67, 75),
          useMaterial3: true),
      home: const NovTest(),
    );
  }
}

class NovTest extends StatefulWidget {
  const NovTest({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NovTestState createState() => _NovTestState();
}

class _NovTestState extends State<NovTest> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
        
        ),

      bottomNavigationBar: const NewNavBar(
        icones: [
          Icons.home,
          Icons.search,
          Icons.favorite,
          Icons.settings,
          Icons.abc,
          Icons.e_mobiledata,
        ],
      ),

    );
  }
}


class NewNavBar extends StatelessWidget {
  final List<IconData> icones;

  const NewNavBar({super.key, required this.icones,});

  @override
  Widget build(BuildContext context) {
    List<Widget> iconButtons = [];
    icones.forEach((icon) {
      iconButtons.add(
        Expanded(
          child: IconButton(
            icon: Icon(icon),
            onPressed: () {},
          ),
        ),
      );
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: iconButtons,
    );
  }
}


