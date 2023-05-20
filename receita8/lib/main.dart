import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum TableStatus{idle,loading,ready,error}

class DataService{

  final ValueNotifier<Map<String,dynamic>> tableStateNotifier = ValueNotifier({
    'status': TableStatus.idle,

    'dataObjects':[]

  });

  void carregar(index){

    final funcoes = [carregarCafes, carregarCervejas, carregarNacoes];

    tableStateNotifier.value = {

      'status': TableStatus.loading,

      'dataObjects': []

    };

    funcoes[index]();

  }

  void carregarCafes(){
    var cafeUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/coffee/random_coffee',
      queryParameters: {'size': '5'});

    http.read(cafeUri).then( (jsonString){

      var cafeJson = jsonDecode(jsonString);

      tableStateNotifier.value = {

        'status': TableStatus.ready,

        'dataObjects': cafeJson,

        'propertyNames': ["blend_name", "origin", "variety"],

        'columnNames': ["Nome", "Origem", "Variedade"]

      };

    });

  }

  void carregarNacoes() async {

    var nacoesUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/nation/random_nation',
        queryParameters: {'size': '5'});

    var jsonString = await http.read(nacoesUri);

    var nacoesJson = jsonDecode(jsonString);

    tableStateNotifier.value = {

        'status': TableStatus.ready,

        'dataObjects': nacoesJson,

        'propertyNames': ["nationality", "language", "capital"],

        'columnNames': ["Nome", "Língua", "Capital"]

      };
  }

  void carregarCervejas() {

    var beersUri = Uri(

      scheme: 'https',

      host: 'random-data-api.com',

      path: 'api/beer/random_beer',

      queryParameters: {'size': '5'});

     http.read(beersUri).then( (jsonString){

      var beersJson = jsonDecode(jsonString);

      tableStateNotifier.value = {

        'status': TableStatus.ready,

        'dataObjects': beersJson,

        'propertyNames': ["name","style","ibu"],

        'columnNames': ["Nome", "Estilo", "IBU"]

      };

    });

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

            switch (value['status']){

              case TableStatus.idle: 
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Center(
                    child: Column(children:[ 
                
                      Image.asset('assets/imagens/bemVindo.gif',
                        fit: BoxFit.contain,
                      ),
                
                      const SizedBox(
                        height: 20,
                      ),

                      const Text('Uso do aplicativo:', 
                        style: TextStyle(fontStyle: FontStyle.italic,
                        fontSize: 20
                        ),
                        
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      const Text(' 1 - Para gerar uma tabela, seleciona algum botão abaixo',
                        style: TextStyle(fontStyle: FontStyle.italic,
                        fontSize: 15)
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      const Text(' 2 - Para mudar a quantidade mostrada, use o Botão popUp',
                        style: TextStyle(fontStyle: FontStyle.italic,
                        fontSize: 15)
                      )
                                               
                    ],
                  
                    ),
                  ),
                );

              case TableStatus.loading:
                return const Center(child: SizedBox(child: CircularProgressIndicator()));

              case TableStatus.ready: 
                return DataTableWidget(

                  jsonObjects:value['dataObjects'], 

                  propertyNames: value['propertyNames'], 

                  columnNames: value['columnNames'],

                );

              case TableStatus.error: 

                return const Text("Ops");

            }

            return const Text("...");

          }

        ),

        bottomNavigationBar: NewNavBar(itemSelectedCallback: dataService.carregar),

      ));

  }

}

class NewNavBar extends HookWidget {

  final _itemSelectedCallback;

  NewNavBar({itemSelectedCallback}):

    _itemSelectedCallback = itemSelectedCallback ?? (int){}

  @override

  Widget build(BuildContext context) {

    var state = useState(1);

    return BottomNavigationBar(

      onTap: (index){

        state.value = index;

        _itemSelectedCallback(index);                

      }, 

      currentIndex: state.value,

      items: const [

        BottomNavigationBarItem(

          label: "Cafés",

          icon: Icon(Icons.coffee_outlined),

        ),

        BottomNavigationBarItem(

            label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),

        BottomNavigationBarItem(

          label: "Nações", icon: Icon(Icons.flag_outlined))

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

              ).toList()       

      ,

      rows: jsonObjects.map( 

        (obj) => DataRow(

            cells: propertyNames.map(

              (propName) => DataCell(Text(obj[propName]))

            ).toList()

          )

        ).toList());

  }

}