import 'package:flutter/material.dart';

List<String> titles = <String>[
  'Administração',
  'Cliente',
];

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        colorSchemeSeed: Color.fromRGBO(35, 34, 37, 1), useMaterial3: true),
        
      home: const SigHat(),

    );
  }
}

class SigHat extends StatelessWidget {
  const SigHat({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    const int tabsCount = 3;

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

          shadowColor: Theme.of(context).shadowColor,

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

        body: TabBarView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,


              children: <Widget> [
                TextButton.icon(
                  style: TextButton.styleFrom(
                    side: const BorderSide(width: 1.0),
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 25),
                  ),

                  label: const Text('Modúlo Boné'),
                  icon: const Icon(Icons.whatshot),
                  onPressed: () {
                  }
                ),
                
                TextButton.icon(
                  style: TextButton.styleFrom(
                    side: const BorderSide(width: 1.0),
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 25),
                  ),

                  label: const Text('Modúlo Fornecedor'),
                  icon: const Icon(Icons.airport_shuttle),
                  onPressed: () {
                  }
                ),

                TextButton.icon(
                  style: TextButton.styleFrom(
                    side: const BorderSide(width: 1.0),
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 25),
                  ),

                  label: const Text('Modúlo Estoque'),
                  icon: const Icon(Icons.all_inclusive),
                  onPressed: () {
                  }
                ),

                TextButton.icon(
                  style: TextButton.styleFrom(
                    side: const BorderSide(width: 1.0),
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 25),
                  ),

                  label: const Text('Relatórios'),
                  icon: const Icon(Icons.add_chart),
                  onPressed: () {
                  }
                ),

              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: <Widget> [
                TextButton.icon(
                  style: TextButton.styleFrom(
                    side: const BorderSide(width: 1.0),
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 25),
                  ),

                  label: const Text('Modúlo Cliente'),
                  icon: const Icon(Icons.people_alt),
                  onPressed: () {
                  }
                ),

                TextButton.icon(
                  style: TextButton.styleFrom(
                    side: const BorderSide(width: 1.0),
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 25),
                  ),
                  
                  label: const Text('Modúlo Pedido'),
                  icon: const Icon(Icons.add_shopping_cart ),
                  onPressed: () {
                  }
                ),

                TextButton.icon(
                  style: TextButton.styleFrom(
                    side: const BorderSide(width: 1.0),
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 25),
                  ),
                  
                  label: const Text('Fechar programa'),
                  icon: const Icon(Icons.adjust),
                  onPressed: () {
                  }
                ),

              ],
            ),
          ],

        ),
      ),
    );
  }
}


