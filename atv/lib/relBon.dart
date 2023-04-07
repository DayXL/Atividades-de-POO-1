import 'package:flutter/material.dart';

class ModulRltBon extends StatefulWidget {
  const ModulRltBon({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ModulRltBonState createState() => _ModulRltBonState();
}

class _ModulRltBonState extends State<ModulRltBon> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Relatório de Bonés'),
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          scrolledUnderElevation: 4.0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(33, 150, 243, 0.6),
                  Color.fromRGBO(3, 169, 244, 0.9)
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
          ),

        ),

        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.withOpacity(0.6),
                Colors.blue.withOpacity(1),
              ],
              stops: const [0.3, 1],
            ),
          ),

          child: 
            SingleChildScrollView(
            scrollDirection: Axis.vertical,

            child:DataTable( dataRowHeight: 200.0,
              columns: const <DataColumn> [
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Código do Boné',
                  ),
                ),
              ),

              DataColumn(
                label: Expanded(
                  child: Text(
                    'Nome do Boné',
                  ),
                ),
              ),

              DataColumn(
                label: Expanded(
                  child: Text(
                    'Quantidade por metro de tecido',
                  ),
                ),
              ),

              DataColumn(
                label: Expanded(
                  child: Text(
                    'Quantidade vendida',
                  ),
                ),
              ),

              DataColumn(
                label: Expanded(
                  child: Text(
                    'Imagem ilustrativa',
                  ),
                ),
              ),

            ]
            , 
            rows: <DataRow> [
              DataRow(
                cells: <DataCell>[
                  const DataCell(Text('10000')),
                  const DataCell(Text('Boné liso')),
                  const DataCell(Text('5')),
                  const DataCell(Text('35')),
                  DataCell(
                    Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/imagens/Bone.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              DataRow(
                cells: <DataCell>[
                  const DataCell(Text('10000')),
                  const DataCell(Text('Boné liso')),
                  const DataCell(Text('5')),
                  const DataCell(Text('35')),
                  DataCell(
                    Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/imagens/Bone.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              DataRow(
                cells: <DataCell>[
                  const DataCell(Text('10000')),
                  const DataCell(Text('Boné liso')),
                  const DataCell(Text('5')),
                  const DataCell(Text('35')),
                  DataCell(
                    Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/imagens/Bone.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            ],  
            ),
          ),
          
        ),
    );
  }

}