import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DataService{

  final ValueNotifier<List> tableStateNotifier = new ValueNotifier([]);
  var chaves = ["name","style","ibu"];
  var colunas = ["Nome", "Estilo", "IBU"];

  void carregar(index){
    var funcoes = [
      carregarCafe,

      carregarCervejas,

      carregarNacoes,

    ];

    funcoes[index]();

  }

  void especCerve() {
    chaves = ["name","style","ibu"];
    colunas = ["Nome", "Estilo", "IBU"];

  }

  void especCafe() {
    chaves = ["name","quant","sab"];
    colunas = ["Nome", "Quantidade", "Sabor"];

  }

  void especPais() {
    chaves = ["name","moeda","hab"];
    colunas = ["Nome", "Moeda", "Habitantes"];

  }

  void carregarCervejas(){

    especCerve();

    tableStateNotifier.value = [{

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

            }

          ];

    }

  void carregarCafe(){

    especCafe();

    tableStateNotifier.value = [{

            "name": "cafe1",

            "quant": "1",

            "sab": "1"

            },

            {

            "name": "cafe2",

            "quant": "2",

            "sab": "2"

            },

            {

            "name": "cafe3", 

            "quant": "3",

            "sab": "3"

            }

          ];

    }

  void carregarNacoes(){

    especPais();

    tableStateNotifier.value = [{

            "name": "pais1",

            "moeda": "1",

            "hab": "1"

            },

            {

            "name": "pais2",

            "moeda": "2",

            "hab": "2"

            },

            {

            "name": "pais3",

            "moeda": "1",

            "hab": "3"

            }

          ];

    }

}

final dataService = DataService();

void main() {

  MyApp app = MyApp();

  runApp(app);

}

class MyApp extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      theme: ThemeData(primarySwatch: Colors.deepPurple),

      debugShowCheckedModeBanner:false,

      home: Scaffold(

        appBar: AppBar( 

          title: const Text("Dicas"),

          ),

        body: ValueListenableBuilder(

          valueListenable: dataService.tableStateNotifier,

          builder:(_, value, __){

            return DataTableWidget(

              jsonObjects: value, 

              propertyNames: dataService.chaves, 

              columnNames: dataService.colunas,


            );

          }

        ),

        bottomNavigationBar: NewNavBar(itemSelectedCallback: dataService.carregar),

      ));

  }

}

class NewNavBar extends HookWidget {

  var itemSelectedCallback; //esse atributo será uma função

  NewNavBar({this.itemSelectedCallback}){

    itemSelectedCallback ??= (_){} ;

  } 

  @override

  Widget build(BuildContext context) {

    var state = useState(1);

    return BottomNavigationBar(

      onTap: (index){

        state.value = index;
        itemSelectedCallback(index);
         
      }, 

      currentIndex: state.value,

      items: const [

        BottomNavigationBarItem(

          label: "Cafés",

          icon: Icon(Icons.coffee_outlined),

        ),

        BottomNavigationBarItem(

            label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),

        BottomNavigationBarItem(label: "Nações", icon: Icon(Icons.flag_outlined))

      ]);

  }

}

class DataTableWidget extends StatelessWidget {

  final List jsonObjects;

  final List<String> columnNames;

  final List<String> propertyNames;

  DataTableWidget( {this.jsonObjects = const [], this.columnNames = const ["Nome","Estilo","IBU"], this.propertyNames= const ["name", "style", "ibu"]});

  @override

  Widget build(BuildContext context) {

    return DataTable(

      columns: columnNames.map( 

        (name) => DataColumn(

          label: Expanded(

            child: Text(name, style: TextStyle(fontStyle: FontStyle.italic))

          )

        )

    ).toList(),

      rows: jsonObjects.map( 

        (obj) => DataRow(

            cells: propertyNames.map(

              (propName) => DataCell(Text(obj[propName]))

            ).toList()

          )

        ).toList());

  }



}