import 'package:flutter/material.dart';


class ModulBon extends StatefulWidget {
  const ModulBon({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ModulBonState createState() => _ModulBonState();
}

class _ModulBonState extends State<ModulBon> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Modulo Boné'),
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
                label: const Text('Cadastrar Boné'),
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
                label: const Text('Editar Boné'),
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
                label: const Text('Pesquisar Boné'),
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
                label: const Text('Excluir Boné'),
                icon: const Icon(Icons.whatshot),
                onPressed: () {}),
              ), 
              
            ],
          ),
          
        ),
      );
  }

}