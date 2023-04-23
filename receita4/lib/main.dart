import 'package:flutter/material.dart';

List<IconData> icones = [Icons.search, Icons.upload, Icons.exit_to_app];

var dataObjects = [
  {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
  {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
  {"name": "Duvel", "style": "Pilsner", "ibu": "82"},
  {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
  {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
  {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
  {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
  {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
  {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
  {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
  {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
];

var coluna = ["Nome", "Estilo", "Ibu"];

var propiedades = ["name", "style", "ibu"];

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
          body: DataBodyWidget(objects: dataObjects, columnNames: coluna, propertyNames: propiedades,),
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
  final List<Map<String, dynamic>> objects;
  final List<String> columnNames;
  final List<String> propertyNames;

  DataBodyWidget(
      {required this.objects,
      required this.columnNames,
      required this.propertyNames});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: DataTable(
            columns: columnNames
                .map((name) => DataColumn(
                    label: Flexible(
                        child: Text(name,
                            style:
                                const TextStyle(fontStyle: FontStyle.italic)))))
                .toList(),
            rows: objects
                .map((obj) => DataRow(
                    cells: propertyNames
                        .map((propName) => DataCell(Text(obj[propName])))
                        .toList()))
                .toList()),
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
