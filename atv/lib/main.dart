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
            ListView(
              children: <Widget> [
                TextButton.icon(
                  label: const Text('Modúlo Boné'),
                  icon: const Icon(Icons.whatshot),
                  onPressed: () {
                  }
                ),

                TextButton.icon(
                  label: const Text('Modúlo Fornecedor'),
                  icon: const Icon(Icons.airport_shuttle),
                  onPressed: () {
                  }
                ),

                TextButton.icon(
                  label: const Text('Modúlo Estoque'),
                  icon: const Icon(Icons.all_inclusive),
                  onPressed: () {
                  }
                ),

                TextButton.icon(
                  label: const Text('Relatórios'),
                  icon: const Icon(Icons.add_chart),
                  onPressed: () {
                  }
                ),

              ],
            ),

            ListView(
              children: <Widget> [
                TextButton.icon(
                  label: const Text('Modúlo Cliente'),
                  icon: const Icon(Icons.people_alt),
                  onPressed: () {
                  }
                ),

                TextButton.icon(
                  label: const Text('Modúlo Pedido'),
                  icon: const Icon(Icons.add_shopping_cart ),
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


