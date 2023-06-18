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
  

}