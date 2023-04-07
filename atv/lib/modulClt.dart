import 'package:flutter/material.dart';

class ModulClt extends StatefulWidget {
  const ModulClt({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ModulCltState createState() => _ModulCltState();
}

class _ModulCltState extends State<ModulClt> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Modulo Cliente'),
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
                label: const Text('Cadastrar Cliente'),
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
                label: const Text('Editar Cliente'),
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
                label: const Text('Pesquisar Cliente'),
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
                label: const Text('Excluir Cliente'),
                icon: const Icon(Icons.people_alt),
                onPressed: () {}),
              ), 
              
            ],
          ),
          
        ),
      );
  }

}