import 'package:flutter/material.dart';

List<IconData> icones = [Icons.search, Icons.upload, Icons.exit_to_app];

var dataObjects = [
  "La Fin Du Monde - Bock - 65 ibu",
  "Sapporo Premiume - Sour Ale - 54 ibu",
  "Duvel - Pilsner - 82 ibu"
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
          body: DataBodyWidget(objects: dataObjects),
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
  List<String> objects;

  DataBodyWidget({this.objects = const []});

  Expanded processarUmElemento(String obj) {
    return Expanded(
      child: Center(child: Text(obj)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: objects
            .map((obj) => Expanded(
                  child: Center(child: Text(obj)),
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
