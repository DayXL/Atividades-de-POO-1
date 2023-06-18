class Ordenador{

  List ordenarCervejasPorNomeCrescente(List cervejas){

    List cervejasOrdenadas = List.of(cervejas);

    bool trocouAoMenosUm;

    do{

      trocouAoMenosUm = false;

      for (int i=0; i<cervejasOrdenadas.length-1; i++){

        var atual = cervejasOrdenadas[i];

        var proximo = cervejasOrdenadas[i+1];

        if (atual["name"].compareTo(proximo["name"]) > 0){

          var aux = cervejasOrdenadas[i];

          cervejasOrdenadas[i] = cervejasOrdenadas[i+1];

          cervejasOrdenadas[i+1] = aux;

          trocouAoMenosUm = true;

        }

      }

    }while(trocouAoMenosUm);

    return cervejasOrdenadas;

  }

  List ordenarCervejasPorNomeDecrescente(List cervejas){

    List cervejasOrdenadas = List.of(cervejas);

    bool trocouAoMenosUm;

    do{

      trocouAoMenosUm = false;

      for (int i=0; i<cervejasOrdenadas.length-1; i++){

        var atual = cervejasOrdenadas[i];

        var proximo = cervejasOrdenadas[i+1];

        if (atual["name"].compareTo(proximo["name"]) > 0){

          var aux = cervejasOrdenadas[i];

          cervejasOrdenadas[i] = cervejasOrdenadas[i+1];

          cervejasOrdenadas[i+1] = aux;

          trocouAoMenosUm = true;

        }

      }

    }while(trocouAoMenosUm);

    return cervejasOrdenadas;

  }

  List ordenarCervejasPorEstiloCrescente(List cervejas){

    List cervejasOrdenadas = List.of(cervejas);

    bool trocouAoMenosUm;

    do{

      trocouAoMenosUm = false;

      for (int i=0; i<cervejasOrdenadas.length-1; i++){

        var atual = cervejasOrdenadas[i];

        var proximo = cervejasOrdenadas[i+1];

        if (atual["style"].compareTo(proximo["style"]) > 0){

          var aux = cervejasOrdenadas[i];

          cervejasOrdenadas[i] = cervejasOrdenadas[i+1];

          cervejasOrdenadas[i+1] = aux;

          trocouAoMenosUm = true;

        }

      }

    }while(trocouAoMenosUm);

    return cervejasOrdenadas;

  }

  List ordenarCervejasPorEstiloDecrescente(List cervejas){

    List cervejasOrdenadas = List.of(cervejas);

    bool trocouAoMenosUm;

    do{

      trocouAoMenosUm = false;

      for (int i=0; i<cervejasOrdenadas.length-1; i++){

        var atual = cervejasOrdenadas[i];

        var proximo = cervejasOrdenadas[i+1];

        if (atual["style"].compareTo(proximo["style"]) > 0){

          var aux = cervejasOrdenadas[i];

          cervejasOrdenadas[i] = cervejasOrdenadas[i+1];

          cervejasOrdenadas[i+1] = aux;

          trocouAoMenosUm = true;

        }

      }

    }while(trocouAoMenosUm);

    return cervejasOrdenadas;

  }

  List ordenarCervejasPorIbuCrescente(List cervejas){

    List cervejasOrdenadas = List.of(cervejas);

    bool trocouAoMenosUm;

    do{

      trocouAoMenosUm = false;

      for (int i=0; i<cervejasOrdenadas.length-1; i++){

        var atual = cervejasOrdenadas[i];

        var proximo = cervejasOrdenadas[i+1];

        if (atual["ibu"].compareTo(proximo["ibu"]) > 0){

          var aux = cervejasOrdenadas[i];

          cervejasOrdenadas[i] = cervejasOrdenadas[i+1];

          cervejasOrdenadas[i+1] = aux;

          trocouAoMenosUm = true;

        }

      }

    }while(trocouAoMenosUm);

    return cervejasOrdenadas;

  }

  List ordenarCervejasPorIbuDecrescente(List cervejas){

    List cervejasOrdenadas = List.of(cervejas);

    bool trocouAoMenosUm;

    do{

      trocouAoMenosUm = false;

      for (int i=0; i<cervejasOrdenadas.length-1; i++){

        var atual = cervejasOrdenadas[i];

        var proximo = cervejasOrdenadas[i+1];

        if (atual["ibu"].compareTo(proximo["ibu"]) > 0){

          var aux = cervejasOrdenadas[i];

          cervejasOrdenadas[i] = cervejasOrdenadas[i+1];

          cervejasOrdenadas[i+1] = aux;

          trocouAoMenosUm = true;

        }

      }

    }while(trocouAoMenosUm);

    return cervejasOrdenadas;

  }

  List ordenarCafePorNomeCrescente(List cafe){

    List cafeOrdenadas = List.of(cafe);

    bool trocouAoMenosUm;

    do{

      trocouAoMenosUm = false;

      for (int i=0; i<cafeOrdenadas.length-1; i++){

        var atual = cafeOrdenadas[i];

        var proximo = cafeOrdenadas[i+1];

        if (atual["blend_name"].compareTo(proximo["blend_name"]) > 0){

          var aux = cafeOrdenadas[i];

          cafeOrdenadas[i] = cafeOrdenadas[i+1];

          cafeOrdenadas[i+1] = aux;

          trocouAoMenosUm = true;

        }

      }

    }while(trocouAoMenosUm);

    return cafeOrdenadas;

  }

  List ordenarCafePorNomeDecrescente(List cafe){

    List cafeOrdenadas = List.of(cafe);

    bool trocouAoMenosUm;

    do{

      trocouAoMenosUm = false;

      for (int i=0; i<cafeOrdenadas.length-1; i++){

        var atual = cafeOrdenadas[i];

        var proximo = cafeOrdenadas[i+1];

        if (atual["blend_name"].compareTo(proximo["blend_name"]) > 0){

          var aux = cafeOrdenadas[i];

          cafeOrdenadas[i] = cafeOrdenadas[i+1];

          cafeOrdenadas[i+1] = aux;

          trocouAoMenosUm = true;

        }

      }

    }while(trocouAoMenosUm);

    return cafeOrdenadas;

  }

  List ordenarCafePorOrigemCrescente(List cafe){

    List cafeOrdenadas = List.of(cafe);

    bool trocouAoMenosUm;

    do{

      trocouAoMenosUm = false;

      for (int i=0; i<cafeOrdenadas.length-1; i++){

        var atual = cafeOrdenadas[i];

        var proximo = cafeOrdenadas[i+1];

        if (atual["origin"].compareTo(proximo["origin"]) > 0){

          var aux = cafeOrdenadas[i];

          cafeOrdenadas[i] = cafeOrdenadas[i+1];

          cafeOrdenadas[i+1] = aux;

          trocouAoMenosUm = true;

        }

      }

    }while(trocouAoMenosUm);

    return cafeOrdenadas;

  }

  List ordenarCafePorOrigemDecrescente(List cafe){

    List cafeOrdenadas = List.of(cafe);

    bool trocouAoMenosUm;

    do{

      trocouAoMenosUm = false;

      for (int i=0; i<cafeOrdenadas.length-1; i++){

        var atual = cafeOrdenadas[i];

        var proximo = cafeOrdenadas[i+1];

        if (atual["origin"].compareTo(proximo["origin"]) > 0){

          var aux = cafeOrdenadas[i];

          cafeOrdenadas[i] = cafeOrdenadas[i+1];

          cafeOrdenadas[i+1] = aux;

          trocouAoMenosUm = true;

        }

      }

    }while(trocouAoMenosUm);
    

    return cafeOrdenadas;

  }

  List ordenarCafePorTipoCrescente(List cafe){

    List cafeOrdenadas = List.of(cafe);

    bool trocouAoMenosUm;

    do{

      trocouAoMenosUm = false;

      for (int i=0; i<cafeOrdenadas.length-1; i++){

        var atual = cafeOrdenadas[i];

        var proximo = cafeOrdenadas[i+1];

        if (atual["variety"].compareTo(proximo["variety"]) > 0){

          var aux = cafeOrdenadas[i];

          cafeOrdenadas[i] = cafeOrdenadas[i+1];

          cafeOrdenadas[i+1] = aux;

          trocouAoMenosUm = true;

        }

      }

    }while(trocouAoMenosUm);

    return cafeOrdenadas;

  }

  List ordenarCafePorTipoDecrescente(List cafe){

    List cafeOrdenadas = List.of(cafe);

    bool trocouAoMenosUm;

    do{

      trocouAoMenosUm = false;

      for (int i=0; i<cafeOrdenadas.length-1; i++){

        var atual = cafeOrdenadas[i];

        var proximo = cafeOrdenadas[i+1];

        if (atual["variety"].compareTo(proximo["variety"]) > 0){

          var aux = cafeOrdenadas[i];

          cafeOrdenadas[i] = cafeOrdenadas[i+1];

          cafeOrdenadas[i+1] = aux;

          trocouAoMenosUm = true;

        }

      }

    }while(trocouAoMenosUm);
    

    return cafeOrdenadas;

  }
  
   List ordenarNacaoPorNomeCrescente(List nacao){

    List nacaoOrdenadas = List.of(nacao);

    bool trocouAoMenosUm;

    do{

      trocouAoMenosUm = false;

      for (int i=0; i<nacaoOrdenadas.length-1; i++){

        var atual = nacaoOrdenadas[i];

        var proximo = nacaoOrdenadas[i+1];

        if (atual["nationality"].compareTo(proximo["nationality"]) > 0){

          var aux = nacaoOrdenadas[i];

          nacaoOrdenadas[i] = nacaoOrdenadas[i+1];

          nacaoOrdenadas[i+1] = aux;

          trocouAoMenosUm = true;

        }

      }

    }while(trocouAoMenosUm);

    return nacaoOrdenadas;

  }

  List ordenarNacaoPorNomeDecrescente(List nacao){

    List nacaoOrdenadas = List.of(nacao);

    bool trocouAoMenosUm;

    do{

      trocouAoMenosUm = false;

      for (int i=0; i<nacaoOrdenadas.length-1; i++){

        var atual = nacaoOrdenadas[i];

        var proximo = nacaoOrdenadas[i+1];

        if (atual["nationality"].compareTo(proximo["nationality"]) > 0){

          var aux = nacaoOrdenadas[i];

          nacaoOrdenadas[i] = nacaoOrdenadas[i+1];

          nacaoOrdenadas[i+1] = aux;

          trocouAoMenosUm = true;

        }

      }

    }while(trocouAoMenosUm);

    return nacaoOrdenadas;

  }

  List ordenarNacaoPorCapitalCrescente(List nacao){

    List nacaoOrdenadas = List.of(nacao);

    bool trocouAoMenosUm;

    do{

      trocouAoMenosUm = false;

      for (int i=0; i<nacaoOrdenadas.length-1; i++){

        var atual = nacaoOrdenadas[i];

        var proximo = nacaoOrdenadas[i+1];

        if (atual["capital"].compareTo(proximo["capital"]) > 0){

          var aux = nacaoOrdenadas[i];

          nacaoOrdenadas[i] = nacaoOrdenadas[i+1];

          nacaoOrdenadas[i+1] = aux;

          trocouAoMenosUm = true;

        }

      }

    }while(trocouAoMenosUm);

    return nacaoOrdenadas;

  }

  List ordenarNacaoPorCapitalDecrescente(List nacao){

    List nacaoOrdenadas = List.of(nacao);

    bool trocouAoMenosUm;

    do{

      trocouAoMenosUm = false;

      for (int i=0; i<nacaoOrdenadas.length-1; i++){

        var atual = nacaoOrdenadas[i];

        var proximo = nacaoOrdenadas[i+1];

        if (atual["capital"].compareTo(proximo["capital"]) > 0){

          var aux = nacaoOrdenadas[i];

          nacaoOrdenadas[i] = nacaoOrdenadas[i+1];

          nacaoOrdenadas[i+1] = aux;

          trocouAoMenosUm = true;

        }

      }

    }while(trocouAoMenosUm);
    

    return nacaoOrdenadas;

  }

  List ordenarNacaoPorIdiomaCrescente(List nacao){

    List nacaoOrdenadas = List.of(nacao);

    bool trocouAoMenosUm;

    do{

      trocouAoMenosUm = false;

      for (int i=0; i<nacaoOrdenadas.length-1; i++){

        var atual = nacaoOrdenadas[i];

        var proximo = nacaoOrdenadas[i+1];

        if (atual["language"].compareTo(proximo["language"]) > 0){

          var aux = nacaoOrdenadas[i];

          nacaoOrdenadas[i] = nacaoOrdenadas[i+1];

          nacaoOrdenadas[i+1] = aux;

          trocouAoMenosUm = true;

        }

      }

    }while(trocouAoMenosUm);

    return nacaoOrdenadas;

  }

  List ordenarNacaoPorIdiomaDecrescente(List nacao){

    List nacaoOrdenadas = List.of(nacao);

    bool trocouAoMenosUm;

    do{

      trocouAoMenosUm = false;

      for (int i=0; i<nacaoOrdenadas.length-1; i++){

        var atual = nacaoOrdenadas[i];

        var proximo = nacaoOrdenadas[i+1];

        if (atual["language"].compareTo(proximo["language"]) > 0){

          var aux = nacaoOrdenadas[i];

          nacaoOrdenadas[i] = nacaoOrdenadas[i+1];

          nacaoOrdenadas[i+1] = aux;

          trocouAoMenosUm = true;

        }

      }

    }while(trocouAoMenosUm);
    

    return nacaoOrdenadas;

  }

   List ordenarNacaoPorEsporteCrescente(List nacao){

    List nacaoOrdenadas = List.of(nacao);

    bool trocouAoMenosUm;

    do{

      trocouAoMenosUm = false;

      for (int i=0; i<nacaoOrdenadas.length-1; i++){

        var atual = nacaoOrdenadas[i];

        var proximo = nacaoOrdenadas[i+1];

        if (atual["national_sport"].compareTo(proximo["national_sport"]) > 0){

          var aux = nacaoOrdenadas[i];

          nacaoOrdenadas[i] = nacaoOrdenadas[i+1];

          nacaoOrdenadas[i+1] = aux;

          trocouAoMenosUm = true;

        }

      }

    }while(trocouAoMenosUm);

    return nacaoOrdenadas;

  }

  List ordenarNacaoPorEsporteDecrescente(List nacao){

    List nacaoOrdenadas = List.of(nacao);

    bool trocouAoMenosUm;

    do{

      trocouAoMenosUm = false;

      for (int i=0; i<nacaoOrdenadas.length-1; i++){

        var atual = nacaoOrdenadas[i];

        var proximo = nacaoOrdenadas[i+1];

        if (atual["national_sport"].compareTo(proximo["national_sport"]) > 0){

          var aux = nacaoOrdenadas[i];

          nacaoOrdenadas[i] = nacaoOrdenadas[i+1];

          nacaoOrdenadas[i+1] = aux;

          trocouAoMenosUm = true;

        }

      }

    }while(trocouAoMenosUm);
    

    return nacaoOrdenadas;

  }

}