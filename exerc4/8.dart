void main() {
    Produto choco = new Produto(1, "Chocolate", "25/06/2023");
    Produto refri = new Produto(3, "Coca cola", "13/11/2023");
    Produto pipoca = new Produto(2, "Churrasco", "10/02/2024");

    Item caixa1 = new Item(3, choco);
    Item caixa2 = new Item(2, refri);
    Item caixa3 = new Item(5, pipoca);

    Venda vend = new Venda("11/03/2023");

    vend.addNewItem(caixa1);
    vend.addNewItem(caixa2);
    vend.addNewItem(caixa3);

    print("O valor total da compra é de:");
    print(vend.total());
}

class Venda {
    final String? data;

    List<Item> itens = [ 

    ];

    double total() {
        return itens.fold(0, (sum, next) => sum + next.total());
    }

    void addNewItem(Item item){
        itens.add(item);
    }

    Venda(this.data);

}

class Item {
    final double quant;
    Produto nome;

    double total() {
        return quant * nome.preco;
    }

    Item(this.quant, this.nome);

}

class Produto {
    final double preco;
    final String descricao;
    final String validade;

    Produto(this.preco, this.descricao, this.validade);
}