import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

enum TableStatus{idle,loading,ready,error}
late final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey;
int quantidadePadrao = 5;
int indexPadrao = 1;

class DataService{

  final ValueNotifier<Map<String,dynamic>> tableStateNotifier = ValueNotifier({
    'status': TableStatus.idle,

    'dataObjects':[]

  });

  Future<void> carregar(index) async {

    final funcoes = [carregarCafes, carregarCervejas, carregarNacoes, carregarBancos];

    tableStateNotifier.value = {

      'status': TableStatus.loading,

      'dataObjects': []

    };

    bool conexaoInternet = await Conexao.verificarConexao();    

    if (conexaoInternet) {

      indexPadrao = index;
      funcoes[index]();

    } 

    else {

      _scaffoldMessengerKey.currentState?.showSnackBar(
        const SnackBar(
          content: Text('Sem conexão com a internet.'),
        ),

      );

    }

  }

  void mudarQuant(quantidade) {
    quantidadePadrao = quantidade;
    carregar(indexPadrao);

  }

  void carregarCafes(){
    var cafeUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/coffee/random_coffee',
      queryParameters: {'size': '$quantidadePadrao'});

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
        queryParameters: {'size': '$quantidadePadrao'});

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

      queryParameters: {'size': '$quantidadePadrao'});

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

  void carregarBancos() async {

    var bancosUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/v2/banks',
      queryParameters: {'size': '$quantidadePadrao'});

    var jsonString = await http.read(bancosUri);

    var bancosJson = jsonDecode(jsonString);

    tableStateNotifier.value = {

        'status': TableStatus.ready,

        'dataObjects': bancosJson,

        'propertyNames': ["bank_name", "account_number", "iban"],

        'columnNames': ["Nome", "Número da conta", "Iban"]

      };
  }

}

final dataService = DataService();

void main() {

  _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  MyApp app = MyApp();

  runApp(app);

}

class MyApp extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      theme: ThemeData(primarySwatch: Colors.deepPurple),

      debugShowCheckedModeBanner:false,

      home: ScaffoldMessenger(

        key: _scaffoldMessengerKey,

        child: Scaffold(
      
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: MyAppBar(),
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
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTableWidget(
                        
                      jsonObjects:value['dataObjects'], 
                        
                      propertyNames: value['propertyNames'], 
                        
                      columnNames: value['columnNames'],
                        
                    ),
                );
      
                case TableStatus.error: 
      
                  return const Text("Ops");
      
              }
      
              return const Text("...");
      
            }
      
          ),
      
          bottomNavigationBar: NewNavBar(itemSelectedCallback: dataService.carregar),
      
        ),
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
      type: BottomNavigationBarType.fixed,

      onTap: (index) {

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

          label: "Cervejas", 
          icon: Icon(Icons.local_drink_outlined)
        
        ),

        BottomNavigationBarItem(

          label: "Nações", 
          icon: Icon(Icons.flag_outlined)
        
        ),

        BottomNavigationBarItem(

          label: "Bancos", 
          icon: Icon(Icons.house_outlined)
        )

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

                    child: Text(name, style: const TextStyle(fontStyle: FontStyle.italic))

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

class Conexao {
  static Future<bool> verificarConexao() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
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
