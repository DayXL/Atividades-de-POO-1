import 'package:flutter/material.dart';

//AS DUAS FORMAS PARA RESOLVER O PROBLEMA QUE O PROFESSOR PASSOU
//ATENDEM AO QUE FOI PEDIDO NA QUESTÃO, AO COMPARAR AS DUAS, SE NOTA QUE A
//QUESTÃO DOIS NA QUAL USAMOS UMA BIBLIOTECA, O CÓDIGO FICOU MENOR, ENQUANTO 
//QUE PARA USAR O "STATEFULWIDGET" PRECISAMOS DE MAIS LINHAS TENDO EM VISTA
//QUE PRECISOU CRIAR UMA OUTRA CLASSE QUE AUXILIA NO CONTROLE DO ESTADO DO
//BOTÃO, ACHO QUE AS DUAS FORMAS FORAM INTERESSANTES.

var dataObjects = [];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print("no build da classe MyApp");
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner:false,

      home: Scaffold(
        appBar: AppBar( 
          title: const Text("Dicas"),
        ),

        body: DataTableWidget(jsonObjects:dataObjects),

        bottomNavigationBar: NewNavBar2(),

      )
    );
  }
}

class NewNavBar2 extends StatefulWidget {
  const NewNavBar2({Key? key}) : super(key: key);

  @override
  _NewNavBar2State createState() => _NewNavBar2State();
}

class _NewNavBar2State extends State<NewNavBar2> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,

      items: const [
        BottomNavigationBarItem(
          label: "Cafés",
          icon: Icon(Icons.coffee_outlined),
        ),

        BottomNavigationBarItem(
          label: "Cervejas",
          icon: Icon(Icons.local_drink_outlined),
        ),

        BottomNavigationBarItem(
          label: "Nações",
          icon: Icon(Icons.flag_outlined),
        ),

      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;

  DataTableWidget( {this.jsonObjects = const [] });

  @override
  Widget build(BuildContext context) {
    print("no build da classe DataTableWidget");

    var columnNames = ["Nome","Estilo","IBU"],

    propertyNames = ["name", "style", "ibu"];

    return DataTable(
      columns: columnNames.map( 
        (name) => DataColumn(

          label: Expanded(
            child: Text(name, style: TextStyle(fontStyle: FontStyle.italic))
          )

        )).toList(),

      rows: jsonObjects.map( 
        (obj) => DataRow(
          cells: propertyNames.map(

            (propName) => DataCell(Text(obj[propName]))

          ).toList()

        )).toList());
  }
}