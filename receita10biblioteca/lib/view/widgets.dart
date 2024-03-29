import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../data/data_service.dart';

class MyApp extends HookWidget {

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      theme: ThemeData(primarySwatch: Colors.deepPurple),

      debugShowCheckedModeBanner:false,

      home: Scaffold(

        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: MyAppBar(callback: dataService.filtrarEstadoAtual),
        ),

        body: ValueListenableBuilder(

          valueListenable: dataService.tableStateNotifier,

          builder:(_, value, __){

            switch (value['status']){

              case TableStatus.idle: 

                return Center(child: Text("Toque em algum botão"));

              case TableStatus.loading:

                return Center(child: CircularProgressIndicator());

              case TableStatus.ready: 

                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                  
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      
                      child: DataTableWidget(
                      jsonObjects: value['dataObjects'], 
                  
                      propertyNames: value['propertyNames'], 
                  
                      columnNames: value['columnNames']
                  
                    )),
                  ),
                ) ;

              case TableStatus.error: 

                return Text("Lascou");

            }

            return Text("...");

  
          }

        ),

        bottomNavigationBar: NewNavBar(itemSelectedCallback: dataService.carregar),

      ));

  }

}

class NewNavBar extends StatelessWidget {

  final _itemSelectedCallback;

  NewNavBar({itemSelectedCallback}):

    _itemSelectedCallback = itemSelectedCallback ?? (int){}

  @override

  Widget build(BuildContext context) {

    return ValueListenableBuilder(

      valueListenable: dataService.tableStateNotifier,

      builder:(_, value, __){

        return BottomNavigationBar(
      
          onTap: (index){
      
            _itemSelectedCallback(index);                
      
          }, 
      
          currentIndex: dataService.tableStateNotifier.value['index'] ?? dataService.indexAntes,
      
          items: const [
      
            BottomNavigationBarItem(
      
              label: "Cafés", icon: Icon(Icons.coffee_outlined),),
      
            BottomNavigationBarItem(label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
      
            BottomNavigationBarItem(label: "Nações", icon: Icon(Icons.flag_outlined))
      
          ]);

      }
    );
    


  }

}


class DataTableWidget extends HookWidget {

  final List jsonObjects;
  final List<String> columnNames;
  final List<String> propertyNames;
  

  DataTableWidget( {this.jsonObjects = const [], this.columnNames = const [], this.propertyNames= const []});

  @override

  Widget build(BuildContext context) {
    final sortAscending = useState(true);
    final sortColumnIndex = useState(1);

    return DataTable(
      sortAscending: sortAscending.value,
      sortColumnIndex: sortColumnIndex.value,

      columns: columnNames.map( 

        (name) => DataColumn(
          onSort: (columnIndex, ascending) {
            sortColumnIndex.value = columnIndex;
            sortAscending.value = !sortAscending.value;

            dataService.ordenarEstadoAtual(propertyNames[columnIndex], sortAscending.value);
          },
          
          label: Expanded(
            child: Text(name, style: TextStyle(fontStyle: FontStyle.italic))

          )

        )

      ).toList(),

      rows: jsonObjects.map( 

        (obj) => DataRow(

            cells: propertyNames.map(

              (propName) => DataCell(Text(obj[propName] ?? ''))

            ).toList()

          )

        ).toList());

  }

}

class MyAppBar extends HookWidget {
  final _callback;

  MyAppBar({callback}):

    _callback = callback ?? (int){}

  @override
  Widget build(BuildContext context) {
    var state = useState(7);

    return AppBar( 
          title: const Text("Dicas"),

          actions:[

          
            Flexible(
              child: Card(
                child: TextField(
                  onChanged: (value) {
                    _callback(value);
                  },
                          
                  decoration: const InputDecoration(
                    hintText: ' Digite algo...',
                    
                  ),
                            
                ),
              ),
            ),

            Flexible(
              child: IconButton(
                icon: const Icon(Icons.arrow_back_outlined), 
                onPressed: () {  
                  dataService.voltarEstadoAnterior();

                },
              ),
            ),

            Flexible(
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_outlined), 
                onPressed: () {  
                  dataService.voltarEstadoSucessor();

                },
              ),
            ),
                       
            PopupMenuButton(
              initialValue: state.value, 

              itemBuilder: (_) => valores.map(

                (num) => PopupMenuItem(
                  value: num,

                  child: Text("Carregar $num itens por vez"),


                ) 

              ).toList(),

              onSelected: (number){
                state.value = number;
                dataService.numberOfItems = number;

              },



            )

          ] 

          
  );
  
}

}