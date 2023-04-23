import 'package:flutter/material.dart';

List<IconData> icones = [Icons.search, Icons.upload, Icons.exit_to_app];

// var dataObjects = [
//   {
//     "name": "La Fin Du Monde",
//     "style": "Bock",
//     "ibu": "65"
//   },

//   {

//     "name": "Sapporo Premiume",
//     "style": "Sour Ale",
//     "ibu": "54"

//   },

//   {

//     "name": "Duvel", 
//     "style": "Pilsner", 
//     "ibu": "82"

//   },

//   {

//     "name": "Sapporo Premiume",
//     "style": "Sour Ale",
//     "ibu": "54"

//   },

//   {

//     "name": "Sapporo Premiume",
//     "style": "Sour Ale",
//     "ibu": "54"

//   },

//   {

//     "name": "Sapporo Premiume",
//     "style": "Sour Ale",
//     "ibu": "54"

//   },

//   {

//     "name": "Sapporo Premiume",
//     "style": "Sour Ale",
//     "ibu": "54"

//   },

//   {

//     "name": "Sapporo Premiume",
//     "style": "Sour Ale",
//     "ibu": "54"

//   },

//   {

//     "name": "Sapporo Premiume",
//     "style": "Sour Ale",
//     "ibu": "54"

//   },

//   {

//     "name": "Sapporo Premiume",
//     "style": "Sour Ale",
//     "ibu": "54"

//   },

//   {

//     "name": "Sapporo Premiume",
//     "style": "Sour Ale",
//     "ibu": "54"

//   },
// ];

// var coluna = ["Nome", "Estilo", "Ibu"];

// var propiedades = ["name", "style", "ibu"];

var dataObjects = [
  {"name": "Arco-Iris", "idade": "2", "cor": "Laranja, preto e branco", "comidaPref": "Peixe"},
  {"name": "BlackTwo", "idade": "1.5", "cor": "Verde rajado", "comidaPref": "Peixe"},
  {"name": "Frajolina ", "idade": "3", "cor": "Verde rajado claro", "comidaPref": "Peixe"},
  {"name": "FrajoTwo", "idade": "1.5", "cor": "Verde rajado e branco", "comidaPref": "Peixe"},
  {"name": "Jaréu", "idade": "2", "cor": "Cinza", "comidaPref": "Peixe"},
  {"name": "Pierre", "idade": "5", "cor": "Verde rajado e branco", "comidaPref": "Peixe"},
  {"name": "Arco-Iris", "idade": "2", "cor": "Laranja, preto e branco", "comidaPref": "Peixe"},
  {"name": "BlackTwo", "idade": "1.5", "cor": "Verde rajado", "comidaPref": "Peixe"},
  {"name": "Frajolina ", "idade": "3", "cor": "Verde rajado claro", "comidaPref": "Peixe"},
  {"name": "FrajoTwo", "idade": "1.5", "cor": "Verde rajado e branco", "comidaPref": "Peixe"},
  {"name": "Jaréu", "idade": "2", "cor": "Cinza", "comidaPref": "Peixe"},
  {"name": "Pierre", "idade": "5", "cor": "Verde rajado e branco", "comidaPref": "Peixe"},

];

var coluna = ["Nome", "Idade", "Cor", "Comida preferida"];

var propiedades = ["name", "idade", "cor", "comidaPref" ];

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: MyAppBar(),
          ),
          body: MytileWidget(objects: dataObjects, columnNames: coluna, propertyNames: propiedades,),
          bottomNavigationBar: NewNavBar(icones: icones),
        ));
  }
}

class NewNavBar extends StatelessWidget {
  List<IconData> icones;

  NewNavBar({super.key, this.icones = const []});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: icones
            .map((obj) => Expanded(
                  child: IconButton(
                    icon: Icon(obj),
                    onPressed: () {},
                  ),
                ))
            .toList());
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Dicas"),
      actions: [
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          itemBuilder: (context) {
            return criarPopupItens(icones);
          },
        )
      ],
    );
  }

  List<PopupMenuItem<IconData>> criarPopupItens(List<IconData> icones) {
    return icones.map((icone) {
      Color cor = Colors.black;
      if (icone == Icons.search) {
        cor = Colors.blue;
      } else if (icone == Icons.upload) {
        cor = Colors.red;
      } else if (icone == Icons.exit_to_app) {
        cor = Colors.green;
      }

      return PopupMenuItem(
        value: icone,
        child: Row(
          children: [
            Icon(icone, color: cor),
          ],
        ),
      );
    }).toList();
  }
}

class MytileWidget extends StatelessWidget {
  final List<Map<String, dynamic>> objects;
  final List<String> columnNames;
  final List<String> propertyNames;
  
  MytileWidget({required this.objects, required this.columnNames,
  required this.propertyNames});

  @override
  Widget build(BuildContext context) {
     return ListView(
      children: [
        ListTile(
          title: Text(columnNames[0]),
          subtitle: Row(
            children: List.generate(columnNames.length - 1, (index) => Expanded(child: Text(columnNames[index+1]))).toList(),
          ),
        ),
        
        //O operador spread ... é usado para criar uma lista de tiles a partir da lista de objetos.
        ...objects.map((obj) => ListTile(
          title: Text(obj[propertyNames[0]].toString()),
          subtitle: Row(
            children: List.generate(propertyNames.length - 1, (index) => Expanded(child: Text(obj[propertyNames[index+1]].toString()))).toList(),
          ),
        )).toList(),
      ],
    );
  }
}

