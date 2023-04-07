import 'package:flutter/material.dart';
import 'package:atv/relatorios.dart';
import 'modulBon.dart';
import 'modulClt.dart';

class EstlFun extends StatelessWidget {
  const EstlFun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: const MeusBotoes(),
    );
  }
}

class MeusBotoes extends StatelessWidget {
  const MeusBotoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ModulBon()));
                  }),
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ModulRlt()));
                  }),
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ModulClt()));
                  }),
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
                  icon: const Icon(Icons.rectangle_rounded),
                  onPressed: () {}),
            ),
          ],
        ),
      ],
    );
  }
}
