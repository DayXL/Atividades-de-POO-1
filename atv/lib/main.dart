import 'package:flutter/material.dart';

List<String> titles = <String>[
  'Administração',
  'Cliente',
];

final List imgs = [

];

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class SigHat extends StatelessWidget {
  const SigHat({super.key});

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
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.withOpacity(0.6),
                Colors.blue.withOpacity(1),
              ],
              stops: const [0.3, 1],
            ),
          ),

          child: TabBarView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[

                  Flexible(

                    
                    child: TextButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[400],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 26, vertical: 13),
                        ),
                        label: const Text('Modúlo Boné'),
                        icon: const Icon(Icons.whatshot),
                        onPressed: () {}),
                  ),
                  Flexible(
                    child: TextButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[400],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 26, vertical: 13),
                        ),
                        label: const Text('Modúlo Fornecedor'),
                        icon: const Icon(Icons.airport_shuttle),
                        onPressed: () {}),
                  ),
                  Flexible(
                    child: TextButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[400],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 26, vertical: 13),
                        ),
                        label: const Text('Modúlo Estoque'),
                        icon: const Icon(Icons.all_inclusive),
                        onPressed: () {}),
                  ),
                  Flexible(
                    child: TextButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[400],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 26, vertical: 13),
                        ),
                        label: const Text('Relatórios'),
                        icon: const Icon(Icons.add_chart),
                        onPressed: () {}),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Flexible(
                    child: TextButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[400],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 26, vertical: 13),
                        ),
                        label: const Text('Modúlo Cliente'),
                        icon: const Icon(Icons.people_alt),
                        onPressed: () {}),
                  ),
                  Flexible(
                    child: TextButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[400],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 26, vertical: 13),
                        ),
                        label: const Text('Modúlo Pedido'),
                        icon: const Icon(Icons.add_shopping_cart),
                        onPressed: () {}),
                  ),
                  Flexible(
                    child: TextButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[400],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 26, vertical: 13),
                        ),
                        label: const Text('Fechar programa'),
                        icon: const Icon(Icons.adjust),
                        onPressed: () {}),
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

