import 'package:flutter/material.dart';

List<IconData> icones = [Icons.search, Icons.upload, Icons.exit_to_app];

var dataObjects = [
  {
    "name": "La Fin Du Monde",
    "style": "Bock",
    "ibu": "65"
  },

  {

    "name": "Sapporo Premiume",
    "style": "Sour Ale",
    "ibu": "54"

  },

  {

    "name": "Duvel", 
    "style": "Pilsner", 
    "ibu": "82"

  },

  {

    "name": "Sapporo Premiume",
    "style": "Sour Ale",
    "ibu": "54"

  },

  {

    "name": "Sapporo Premiume",
    "style": "Sour Ale",
    "ibu": "54"

  },

  {

    "name": "Sapporo Premiume",
    "style": "Sour Ale",
    "ibu": "54"

  },

  {

    "name": "Sapporo Premiume",
    "style": "Sour Ale",
    "ibu": "54"

  },

  {

    "name": "Sapporo Premiume",
    "style": "Sour Ale",
    "ibu": "54"

  },

  {

    "name": "Sapporo Premiume",
    "style": "Sour Ale",
    "ibu": "54"

  },

  {

    "name": "Sapporo Premiume",
    "style": "Sour Ale",
    "ibu": "54"

  },

  {

    "name": "Sapporo Premiume",
    "style": "Sour Ale",
    "ibu": "54"

  },
];

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
          body: MytileWidget(objects: dataObjects),
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

class DataBodyWidget extends StatelessWidget {
  List objects;

  DataBodyWidget({this.objects = const []});

  @override
  Widget build(BuildContext context) {
    var columnNames = ["Nome","Estilo","IBU"],

    propertyNames = ["name", "style", "ibu"];

    return Center(
      child: SingleChildScrollView(
        child: DataTable(
          columns: columnNames.map( 
            (name) => DataColumn(
              label: Flexible(
                child: Text(name, style: const TextStyle(fontStyle: FontStyle.italic))
              )
      
            )).toList(),
      
          rows: objects.map( 
            (obj) => DataRow(
              cells:propertyNames.map(
                  (propName) => DataCell(Text(obj[propName]))
                  
                ).toList()
              )
      
            ).toList()),
      ),
    );
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
  final List objects;
  
  MytileWidget({required this.objects});

  @override
  Widget build(BuildContext context) {
    var columnNames = ["Nome","Estilo","IBU"],

    propertyNames = ["name", "style", "ibu"];

    return Center(
      child: SingleChildScrollView(
        child: DataTable(
          columns: columnNames.map( 
            (name) => DataColumn(
              label: Flexible(
                child: Text(name, style: const TextStyle(fontStyle: FontStyle.italic))
              )
      
            )).toList(),
      
          rows: objects.map( 
            (obj) => DataRow(
              cells:propertyNames.map(
                  (propName) => DataCell(Text(obj[propName]))
                  
                ).toList()
              )
      
            ).toList()),
      ),
    );
  }
}
