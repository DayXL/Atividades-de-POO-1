import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

enum TableStatus{idle,loading,ready,error}
enum ItemType{beer, coffee, nation, none}

class DataService{
  static const MAX_N_ITEMS = 15;

  static const MIN_N_ITEMS = 3;

  static const DEFAULT_N_ITEMS = 7;

  int _numberOfItems = DEFAULT_N_ITEMS;

  set numberOfItems(n){

    _numberOfItems = n < 0 ? MIN_N_ITEMS: n > MAX_N_ITEMS? MAX_N_ITEMS: n;

  }
  
  final ValueNotifier<Map<String,dynamic>> tableStateNotifier = ValueNotifier({
    'status':TableStatus.idle,
    'dataObjects':[],
    'itemType': ItemType.none
  });

  void carregar(index){

    final tipo = [ItemType.coffee, ItemType.beer, ItemType.nation];
    final links = ['api/coffee/random_coffee', 'api/beer/random_beer', 'api/nation/random_nation'];
    final propiedades = [["blend_name","origin","variety"], ["name","style","ibu"], ["nationality","capital","language","national_sport"]];
    final colunas = [["Nome", "Origem", "Tipo"], ["Nome", "Estilo", "IBU"], ["Nome", "Capital", "Idioma","Esporte"]];

    if (tableStateNotifier.value['status'] == TableStatus.loading) return;

    if (tableStateNotifier.value['itemType'] != tipo[index]){

      tableStateNotifier.value = {

        'status': TableStatus.loading,

        'dataObjects': [],

        'itemType': tipo[index]

      };

    }

    var uri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: links[index],
      queryParameters: {'size': '$_numberOfItems'}
    );

    http.read(uri).then((jsonString){

      var json = jsonDecode(jsonString);  

      //se já houver cafés no estado da tabela...

      if (tableStateNotifier.value['status'] != TableStatus.loading) json = [...tableStateNotifier.value['dataObjects'], ...json];

      tableStateNotifier.value = {

        'itemType':tipo[index],

        'status': TableStatus.ready,

        'dataObjects': json,

        'propertyNames': propiedades[index],

        'columnNames': colunas[index]

      };
    });

  }

}



final dataService = DataService();