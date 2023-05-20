import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

int quantidadePadrao = 5;

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

  void mudarQuant(quantidade) {

    quantidadePadrao = quantidade;

  }

  void especCerve() {
    chaves = ["name","style","ibu"];
    colunas = ["Nome", "Estilo", "IBU"];

  }

  void especCafe() {
    chaves = ["blend_name","origin","variety"];
    colunas = ["Nome", "Origem", "Variedade"];

  }

  void especPais() {
    chaves = ["nationality","language","capital"];
    colunas = ["Nome", "Língua", "Capital"];

  }

  Future<void> carregarCervejas()async {

    especCerve();

    var beersUri = Uri(

      scheme: 'https',

      host: 'random-data-api.com',

      path: 'api/beer/random_beer',

      queryParameters: {'size': '$quantidadePadrao'});

    var jsonString = await http.read(beersUri);

    var beersJson = jsonDecode(jsonString);

    tableStateNotifier.value = beersJson;

  }

  Future<void> carregarCafe() async {

    especCafe();

    var cafeUri = Uri(

      scheme: 'https',

      host: 'random-data-api.com',

      path: 'api/coffee/random_coffee',

      queryParameters: {'size': '$quantidadePadrao'});

      var jsonString = await http.read(cafeUri);

      var cafeJson = jsonDecode(jsonString);

      tableStateNotifier.value = cafeJson;
      
    }

  Future<void> carregarNacoes() async {

    especPais();

    var nacoesUri = Uri(

      scheme: 'https',

      host: 'random-data-api.com',

      path: 'api/nation/random_nation',

      queryParameters: {'size': '$quantidadePadrao'});

      var jsonString = await http.read(nacoesUri);

      var nacoesJson = jsonDecode(jsonString);

      tableStateNotifier.value = nacoesJson;

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

        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: MyAppBar(),
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

            label: "Cervejas", 

            icon: Icon(Icons.local_drink_outlined)

        ),

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

    return SingleChildScrollView(
      
      scrollDirection: Axis.vertical,

      child: DataTable(
      
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
      
          ).toList()),
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
          
          onSelected: (quantidade) {
            dataService.mudarQuant(quantidade);
          },
          
          icon: const Icon(Icons.more_vert),

          itemBuilder: (context) {
            return criarPopupItens();
          },

        )
      ],
    );
  }

  criarPopupItens() {
    return const [
      PopupMenuItem(
        value: 5,
        child: Text('5'),

      ),

      PopupMenuItem( 
        value: 10,
        child: Text('10'),

      ),

      PopupMenuItem( 
        value: 15,
        child: Text('15'),

      ),
    ];
       
    
  }
  
}