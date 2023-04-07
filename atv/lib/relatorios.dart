import 'package:flutter/material.dart';
import 'relBon.dart';

class ModulRlt extends StatefulWidget {
  const ModulRlt({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ModulRltState createState() => _ModulRltState();
}

class _ModulRltState extends State<ModulRlt> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Modulo Relatorio'),
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

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Flexible(
                child: TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26, vertical: 13),
                ),
                label: const Text('Relatório de Boné'),
                icon: const Icon(Icons.add_chart),
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ModulRltBon()));

                }),
              ),

              Flexible(
                child: TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26, vertical: 13),
                ),
                label: const Text('Relatório de Cliente'),
                icon: const Icon(Icons.add_chart),
                onPressed: () {}),
              ),

              Flexible(
                child: TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26, vertical: 13),
                ),
                label: const Text('Relatório de Fornecedor'),
                icon: const Icon(Icons.add_chart),
                onPressed: () {}),
              ), 

              Flexible(
                child: TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26, vertical: 13),
                ),
                label: const Text('Relatório de Estoque'),
                icon: const Icon(Icons.add_chart),
                onPressed: () {}),
              ), 

              Flexible(
                child: TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26, vertical: 13),
                ),
                label: const Text('Relatório de Pedidos'),
                icon: const Icon(Icons.add_chart),
                onPressed: () {}),
              ), 
              
            ],
          ),
          
        ),
    );
  }

}